//
//  SampleClass.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/17.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import <objc/runtime.h>
#import "SampleClass.h"

@interface SampleClass()
@property float fl2;
@end

@implementation SampleClass

- (id) init {
    if (self = [super init]) {
        self.string1 = @"string 1!";
        self.fl1 = 10.1F;

        NSArray* ary = [self allKeys];
        
        
    }
    return self;
}

// プロパティを取得する
- (NSArray *)allKeys{

    u_int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertyArray = [NSMutableArray arrayWithCapacity:count];

    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        [propertyArray addObject:@(propertyName)];
    }
    free(properties);
    
    return [NSArray arrayWithArray:propertyArray];
}


@end
