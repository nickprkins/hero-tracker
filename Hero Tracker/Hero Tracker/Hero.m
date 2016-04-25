//
//  Hero.m
//  Hero Tracker
//
//  Created by Nick Perkins on 4/23/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import "Hero.h"

@implementation Hero

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict
{
    Hero *aHero = nil;
    if (heroDict)
    {
        aHero = [[Hero alloc] init];
        aHero.heroName = [heroDict objectForKey:@"heroName"];
        
        aHero.firstName = [heroDict objectForKey:@"firstName"];
        
        aHero.middleName = [heroDict objectForKey:@"middleName"];
        aHero.nickName = [heroDict objectForKey:@"nickName"];
        aHero.lastName = [heroDict objectForKey:@"lastName"];
        aHero.height = [heroDict objectForKey:@"height"];
        aHero.weight = [heroDict objectForKey:@"weight"];
        aHero.powers = [heroDict objectForKey:@"powers"];
        aHero.abilities = [heroDict objectForKey:@"abilities"];
        aHero.thumbnail = [heroDict objectForKey:@"thumbnail"];
        aHero.imagelarge = [heroDict objectForKey:@"imageLarge"];
        aHero.location = [heroDict objectForKey:@"location"];
    }
    return aHero;
}


@end
