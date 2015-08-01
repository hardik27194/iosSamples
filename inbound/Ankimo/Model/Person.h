//
//  Person.h
//  Ankimo
//
//  Created by takeshi on 2015/07/26.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

#import "RLMObject.h"

//BOOL, bool, int, NSInteger, long, long long, float, double, CGFloat, NSString, NSDate(少数点以下は切り捨て), NSData

@class Person;

@interface Person : RLMObject

@property NSString *Id;
@property NSString *name;
//@property NSInteger       version;

@end
