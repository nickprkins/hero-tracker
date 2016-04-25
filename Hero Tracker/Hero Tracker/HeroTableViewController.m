//
//  HeroTableViewController.m
//  Hero Tracker
//
//  Created by Nick Perkins on 4/22/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import "HeroTableViewController.h"
#import "HeroDetailViewController.h"
#import "Hero.h"

@interface HeroTableViewController ()

@property NSMutableArray *heroes;

@end

@implementation HeroTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"S.H.I.E.L.D Hero Tracker";
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
    [tempImageView setFrame:self.tableView.frame];
    
    self.tableView.backgroundView = tempImageView;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //Initialize Heroes Array
    self.heroes = [[NSMutableArray alloc]init];
    
    //Call the method Heroes
    [self loadHeroes];
}

- (void)loadHeroes
{
    // This creates a string with the filepath to the heroes JSON file.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@"json"];
    // This is a built in method that allows us to load a JSON file into native Cocoa objects (NSDictionaries and NSArrays).
    NSArray *heroes = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    NSSortDescriptor *firstDescriptor = [[NSSortDescriptor alloc] initWithKey:@"heroName" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:firstDescriptor, nil];
    NSArray *sortedArray = [heroes sortedArrayUsingDescriptors:sortDescriptors];
    heroes = [sortedArray copy];
    
    for (NSDictionary *heroDictionary in heroes) {
        
        Hero * aHero = [Hero heroWithDictionary: heroDictionary];
        [self.heroes addObject:aHero];
    }
    
    [[self tableView] reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.heroes.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 80.; // you can have your own choice, of course
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8.; // you can have your own choice, of course
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableView" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithWhite:0.8 alpha:.3];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:1.0 alpha:.3];
    cell.layer.shadowOpacity = 1.0;
    cell.layer.shadowRadius = 0.0;
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(0.0, -1.0);
    cell.textLabel.textColor = [UIColor colorWithWhite:1.0 alpha:.7];
    cell.textLabel.highlightedTextColor = [UIColor darkGrayColor];
    cell.detailTextLabel.highlightedTextColor = [UIColor darkGrayColor];
    
    // Configure the cell...
    self.tableView.contentInset = UIEdgeInsetsMake(70, -5, 0, 0);
    UIImageView *itemImageView = (UIImageView *)[cell imageView];
    itemImageView.layer.cornerRadius = 40;
    itemImageView.layer.borderWidth = 1.0f;
    //itemImageView.layer.borderColor = [UIColor concreteColor].CGColor;
    itemImageView.layer.masksToBounds = YES;
    itemImageView.clipsToBounds = YES;
    
    
    Hero *aHero = self.heroes[indexPath.section];
    cell.textLabel.text = aHero.heroName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Locale: %@", aHero.location];
    
    NSString *thumbnail = aHero.thumbnail;
    NSString *path = [NSString stringWithFormat:@"%@.jpg", thumbnail];
    cell.imageView.image = [UIImage imageNamed:path];
    
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"segueHeroDetail"])
    {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        Hero *selectedHero = self.heroes[indexPath.section];
        HeroDetailViewController *heroDetailViewController = (HeroDetailViewController *)[segue destinationViewController];
        heroDetailViewController.hero = selectedHero;
    }
}


@end
