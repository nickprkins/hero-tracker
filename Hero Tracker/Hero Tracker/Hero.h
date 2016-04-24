//
//  Hero.h
//  Hero Tracker
//
//  Created by Nick Perkins on 4/23/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic) NSString *heroName;
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *middleName;
@property (nonatomic) NSString *nickName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *height;
@property (nonatomic) NSString *weight;
@property (nonatomic) NSString *powers;
@property (nonatomic) NSString *abilities;
@property (nonatomic) NSString *thumbnail;
@property (nonatomic) NSString *imagelarge;
@property (nonatomic) NSString *location;

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict;

@end
