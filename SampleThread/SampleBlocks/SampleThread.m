//
//  SampleThread.m
//  SampleBlocks
//
//  Created by 島田 武史 on 2015/07/02.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import "SampleThread.h"

@implementation SampleThread

-(void)sampleThread {


//  [self foo];
//  [self bar];

  [NSThread detachNewThreadSelector:@selector(foo) toTarget:self withObject:nil];
  [NSThread detachNewThreadSelector:@selector(bar) toTarget:self withObject:nil];

}

-(void)foo {
  @autoreleasepool {
    for (NSInteger i = 1; i<1000; i++) {
      NSLog(@"foo %ld",i);
    }
  }
}

-(void)bar {
  @autoreleasepool {
    for (NSInteger i = 1; i<1000; i++) {
      NSLog(@"bar %ld",i);
    }
  }
}


@end
