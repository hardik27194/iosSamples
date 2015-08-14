//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "ViewController.h"
#import "SampleOperation.h"
#import "Sample2Operation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.2];


  [self temp2];

}

// 非並列実行モード
-(void)temp1 {

  // マルチスレッドで処理
  NSOperationQueue *queue = [[NSOperationQueue alloc] init];

  // メインスレッドで処理
  //NSOperationQueue *queue = [NSOperationQueue mainQueue];

  for (int i = 0; i < 100; i++) {
    SampleOperation *operation = [[SampleOperation alloc] init];
    operation.idx = i;
    [queue addOperation:operation];
  }

}

// 並列実行モード
-(void)temp2 {

  // マルチスレッドで処理
  NSOperationQueue *queue = [[NSOperationQueue alloc] init];

  // メインスレッドで処理
//  NSOperationQueue *queue = [NSOperationQueue mainQueue];

  for (int i = 0; i < 100; i++) {
    Sample2Operation *operation = [[Sample2Operation alloc] init];
    operation.idx = i;
    [queue addOperation:operation];
  }
  
}


@end
