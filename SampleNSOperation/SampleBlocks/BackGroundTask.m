//
//  BackGroundTask.m
//  SampleBlocks
//
//  Created by 島田 武史 on 2015/07/02.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import "BackGroundTask.h"

@implementation BackGroundTask

-(void)main {

  [[NSOperationQueue mainQueue] addOperationWithBlock:^(){
    for (NSInteger i = 1; i<1000; i++) {
      NSLog(@"foo %ld",i);
    }
  }];

}

-(BOOL)isConcurrent {
  return YES;
}

@end
