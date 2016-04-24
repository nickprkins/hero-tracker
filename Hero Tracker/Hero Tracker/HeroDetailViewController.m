//
//  HeroDetailViewController.m
//  Hero Tracker
//
//  Created by Nick Perkins on 4/22/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import "HeroDetailViewController.h"

@interface HeroDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *heroNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageLarge;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *powersLabel;
@property (weak, nonatomic) IBOutlet UILabel *abilitiesLabel;

- (void)configureView;

@end

@implementation HeroDetailViewController

- (void)setHero:(Hero *)newHero
{
    if (_hero != newHero)
    {
        _hero = newHero;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{

    if (self.hero)
    {
        //Took this off. Prefer the heroLabel show where user is.
        //self.navigationItem.title = [NSString stringWithFormat:@"%@", self.hero.heroName];
        
        self.heroNameLabel.text = [NSString stringWithFormat:@"%@", self.hero.heroName];
        self.firstNameLabel.text = [NSString stringWithFormat:@"Real Name: %@", self.hero.firstName];
        self.middleNameLabel.text = [NSString stringWithFormat:@"%@", self.hero.middleName];
        self.nickNameLabel.text = [NSString stringWithFormat:@"%@", self.hero.nickName];
        self.lastNameLabel.text = [NSString stringWithFormat:@"%@", self.hero.lastName];
        self.heightLabel.text = [NSString stringWithFormat:@"Height: %@", self.hero.height];
        self.weightLabel.text = [NSString stringWithFormat:@"Weight: %@", self.hero.weight];
        
        self.powersLabel.text = [NSString stringWithFormat:@"Powers: %@", self.hero.powers];
        self.abilitiesLabel.text = [NSString stringWithFormat:@"Abilities: %@", self.hero.abilities];

        NSString *imageProfile = self.hero.imagelarge;
        [_imageLarge setImage: [UIImage imageNamed:imageProfile]];
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    [self configureView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
