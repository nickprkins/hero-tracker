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
@property (nonatomic) NSString *thumbnail;

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict;

@end
