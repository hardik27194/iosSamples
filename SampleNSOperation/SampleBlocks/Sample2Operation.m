//
//  SampleOperation.m
//  SampleBlocks
//
//  Created by 島田 武史 on 2015/07/02.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import "Sample2Operation.h"

@implementation Sample2Operation

#pragma mark -- hjkl;:
-(instancetype)init {
  self = [super init];
  if (self) {

  }
  isExecuting = NO;
  isFinished = NO;

  return self;

}

#pragma mark -- hjkl;:
-(void)start {

  //  isExecuting = YES や isFinished = YES のような書き方だと通知されないので注意してください。
  // http://d.hatena.ne.jp/glass-_-onion/20110706/1309909082

  NSLog(@" start  並列実行モード %d", self.idx);

  [self setValue:[NSNumber numberWithBool:YES] forKey:@"isExecuting"];

  sleep(rand() % 5);

  [self setValue:[NSNumber numberWithBool:NO] forKey:@"isExecuting"];
  [self setValue:[NSNumber numberWithBool:YES] forKey:@"isFinished"];

  NSLog(@" finish 並列実行モード %d", self.idx);

}

// 監視するキー値の設定
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString*)key {
  if ([key isEqualToString:@"isExecuting"] ||
      [key isEqualToString:@"isFinished"]) {
    return YES;
  }
  return [super automaticallyNotifiesObserversForKey:key];
}

-(BOOL)isConcurrent {
  return YES;
}

-(BOOL)isExecuting {
  return isExecuting;
}

-(BOOL)isFinished {
  return isFinished;
}

@end
