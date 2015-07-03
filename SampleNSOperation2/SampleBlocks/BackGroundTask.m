//
//  BackGroundTask.m
//  SampleBlocks
//
//  Created by 島田 武史 on 2015/07/02.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import "BackGroundTask.h"

@interface BackGroundTask() {

@private
  BOOL isExecuting;
  BOOL isFinished;

}
@end

@implementation BackGroundTask

// 監視するキーの設定
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString*)key {
  if ([key isEqualToString:@"isExecuting"] ||
      [key isEqualToString:@"isFinished"]) {
    return YES;
  }
  return [super automaticallyNotifiesObserversForKey:key];
}

// YES を返さないとメインスレッド以外で動かなくなる
- (BOOL)isConcurrent {
  return YES;
}

-(instancetype)init {

  self = [super init];
  if (self) {
    isExecuting = NO;
    isFinished = NO;
  }
  return self;
}

-(void)start {

  isExecuting = YES;

  NSLog(@"1");

  // 分かりやすいようにスリープを入れる
  [NSThread sleepForTimeInterval:2.0];

  NSLog(@"2");

  // 処理中フラグをオフ
  isExecuting = NO;

  // 処理終了フラグ
//  isFinished = YES;

}

-(BOOL)isExecuting {
  return isExecuting;
}

-(BOOL)isFinished {
  return isFinished;
}



@end
