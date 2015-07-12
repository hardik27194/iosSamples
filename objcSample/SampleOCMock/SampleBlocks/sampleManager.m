//
//  sampleManager.m
//  SampleBlocks
//
//  Created by takeshi on 2015/05/21.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import "sampleManager.h"

@implementation sampleManager


+(sampleManager *)sharedInstance {
    static sampleManager* _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[sampleManager alloc] init];
    });
    return _instance;
}

-(void)sampleMethod
{

}


-(void)sampleMethod1
{



}


@end
