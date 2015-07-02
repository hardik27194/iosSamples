//
//  SampleThread.m
//  SampleBlocks
//
//  Created by 島田 武史 on 2015/07/02.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import "SampleThread.h"
#import "BackGroundTask.h"

@implementation SampleThread

-(void)sampleThread {
  
  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
  BackGroundTask *operation = [[BackGroundTask alloc] init];
  [queue addOperation:operation];

}

@end
