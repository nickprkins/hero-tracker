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
        NSString *heroName = self.hero.heroName;
        // DELETE THIS IF SURE NOT NEED - NSArray *heroArray = [heroName componentsSeparatedByString:@" "];
        
        self.navigationItem.title = [NSString stringWithFormat:@"%@", self.hero.heroName];
        
        self.heroNameLabel.text = [NSString stringWithFormat:@"%@", self.hero.heroName];
        self.firstNameLabel.text = [NSString stringWithFormat:@"%@", self.hero.firstName];
        self.middleNameLabel.text = [NSString stringWithFormat:@"%@", self.hero.middleName];
        self.nickNameLabel.text = [NSString stringWithFormat:@"%@", self.hero.nickName];
        self.lastNameLabel.text = [NSString stringWithFormat:@"%@", self.hero.lastName];

    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
