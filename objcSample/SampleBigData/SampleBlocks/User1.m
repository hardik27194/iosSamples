//
//  User1.m
//  SampleBlocks
//
//  Created by takeshi on 2015/06/03.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import <Realm/Realm.h>
#import "User1.h"

@implementation User1

+ (NSString *)primaryKey
{
    return @"name";
}

+ (NSArray *)indexedProperties
{
    return @[@"name"];
}

@end
