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

    
    //
    // 6. Once we have an array of dictionaries, we need to iterate over them and convert them into Agent objects.
    //
    //    Type in "forin" below. It should offer code completion for a for-in loop. Just hit enter to accept it.
    //    Use the "agents" array from above as the array to iterate over. Create an NSDictionary object on the left side
    //    of the for-in loop. You will use this inside the for loop to create an Agent object.
    // NICK NOTE: Got help from instructor about all of this.  Review this more to fully understand what happens here.
    
    for (NSDictionary *heroDictionary in heroes) {
        
        Hero * aHero = [Hero heroWithDictionary: heroDictionary];
        [self.heroes addObject:aHero];
    }
    
    //
    // 7. Now that we have agent objects, call a method to instruct the table to reload its data.
    //
    [[self tableView] reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.heroes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableView" forIndexPath:indexPath];
    
    
    // Configure the cell...
    self.tableView.contentInset = UIEdgeInsetsMake(70, -5, 0, 0);
    UIImageView *itemImageView = (UIImageView *)[cell imageView];
    itemImageView.layer.cornerRadius = 22;
    itemImageView.layer.borderWidth = 1.0f;
    //itemImageView.layer.borderColor = [UIColor concreteColor].CGColor;
    itemImageView.layer.masksToBounds = YES;
    itemImageView.clipsToBounds = YES;
    
    
    Hero *aHero = self.heroes[indexPath.row];
    cell.textLabel.text = aHero.heroName;
    cell.detailTextLabel.text = aHero.firstName;
    //UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 115)];
//NSString *path = [[NSBundle mainBundle] pathForResource:[item objectForKey:@"imageKey"] ofType:@"png"];
//    UIImage *theImage = [UIImage imageWithContentsOfFile:path];
    NSString *thumbnail = aHero.thumbnail;
    NSString *path = [NSString stringWithFormat:@"%@.jpg", thumbnail];
    NSLog(@"%@", path);
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
        Hero *selectedHero = self.heroes[indexPath.row];
        HeroDetailViewController *heroDetailViewController = (HeroDetailViewController *)[segue destinationViewController];
        heroDetailViewController.hero = selectedHero;
    }
}


@end
