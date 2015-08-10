//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.2];

  [self test4];

}

// NSOperation クラス作らないでいいので簡単
// addOperationWithBlock を使ってNSOperationのブロックオブジェクトを渡す
-(void)test1 {

  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
  for (int i = 0; i < 100; i++) {
    __block int num = i;
    [queue addOperationWithBlock:^{
      sleep(rand() % 3);
      NSLog(@"test1 %d", num);
    }];
  }

  // キューイングされたすべての処理が終わるまで待つ
  [queue waitUntilAllOperationsAreFinished];
  NSLog(@" finish ");

}

-(void)test2 {

  // NSBlockOperation を使用してNSOperationを作成
  // NSBlockOperation はNSOperation のサブクラス
  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
  for (int i = 0; i < 100; i++) {
    __block int num = i;
    NSOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
      sleep(rand() % 3);
      NSLog(@"test1 %d", num);
    }];
    [queue addOperation:operation];
  }

  // キューイングされたすべての処理が終わるまで待つ
  [queue waitUntilAllOperationsAreFinished];
  NSLog(@" finish ");
  
}


-(void)test3 {

  //　メインじゃないキュー　
  NSOperationQueue *queue = [[NSOperationQueue alloc] init];

  // メインキュー
  NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];


}

-(void)test4 {

  // operation を array に突っ込んで
  // キューに一気に突っ込む
  NSMutableArray *operations = [@[] mutableCopy];

  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
  for (int i = 0; i < 100; i++) {
    __block int num = i;
    NSOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
      sleep(rand() % 3);
      NSLog(@"test1 %d", num);
    }];
    [operations addObject:operation];
  }

  //　waitUntilFinished をYESにすると全部終わるまで待つ
  [queue addOperations:operations waitUntilFinished:YES];

  NSLog(@" finish ");

}


@end
