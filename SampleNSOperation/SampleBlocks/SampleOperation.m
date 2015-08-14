//
//  SampleOperation.m
//  SampleBlocks
//
//  Created by 島田 武史 on 2015/07/02.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import "SampleOperation.h"

@implementation SampleOperation

-(void)main {

  sleep(rand() % 10);
  NSLog(@" finish task %d", self.idx);
}

-(BOOL)isConcurrent {
  return YES;
}

@end
