//
//  SampleManager.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/17.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "SampleManager.h"

@implementation SampleManager


+ (SampleManager*)sharedInstance
{
    
    static SampleManager* sharedInstance;
    static dispatch_once_t once;
    dispatch_once( &once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

-(void)execute1
{

    [self execute2];
    
    
}

-(void)execute2
{

    NSLog(@"ghjK");
    

}

@end

