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

  [self test5];

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


-(void)test5 {
  // 依存

  NSOperationQueue *queue = [[NSOperationQueue alloc] init];

  NSOperation *operation1= [NSBlockOperation blockOperationWithBlock:^{
    sleep(rand() % 3);
    NSLog(@"test1");
  }];

  NSOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
    sleep(rand() % 3);
    NSLog(@"test2");
  }];

  NSOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
    sleep(rand() % 3);
    NSLog(@"test3");
  }];

  // 3 -> 2 -> 1 の順番に実行する
  [operation1 addDependency:operation2];
  [operation2 addDependency:operation3];


  // 1->2->3 の順番にいれるけど実行順は違う
  [queue addOperation:operation1];
  [queue addOperation:operation2];
  [queue addOperation:operation3];

  // 全部終わるまで待つ
  [queue waitUntilAllOperationsAreFinished];

  NSLog(@" finish ");
  
}


@end
