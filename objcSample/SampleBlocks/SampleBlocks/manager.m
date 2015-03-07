//
//  manager.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/17.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "manager.h"

@implementation manager

- (void)execute:(NSString*)string callback:(LoginCallBack)callback{

    if (callback) {
        callback(string);
    }
}

@end
