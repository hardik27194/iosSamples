//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "ViewController.h"

@interface MyObject : NSObject
@end

@implementation MyObject
-(void)hello {
  NSLog(@"hello");
}
@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self gcdTest3];

}


-(void)gcdTest1 {

  for (int i = 0; i < 10; i++) {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^() {

      int rnd = rand()%5;
      sleep(rnd);
      NSLog(@" %d" , i);

      const char *label = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL);
      NSLog(@"実行キュー: %s", label);

    });
  }

  NSLog(@" finish ");

}

-(void)gcdTest2 {

  // dispatch_queue_attr_tでは、キューのタイプが直列か並列を指定します。
  // 直列の場合はDISPATCH_QUEUE_SERIALを、並列の場合はDISPATCH_QUEUE_CONCURRENTを指定します。
  // https://github.com/mixi-inc/iOSTraining/wiki/8.2-Grand-Central-Dispatch
  // DISPATCH_QUEUE_SERIALは順番に実行する
  // DISPATCH_QUEUE_CONCURRENTは並列に実行する

  // DISPATCH_QUEUE_CONCURRENTの場合でも
  //  _apply が(1の処理）が終わってから2,3が平行で走っている感じ？
  // dispatch_applyは2スレッドっぽい？
  // http://fernweh.jp/b/grandcentraldispatch/

  //「dispatch_applyはグローバルキューに渡していても、ちゃんと全てのブロックが処理されるのを待ちますので、。。」
  // 待つんだ..
  // http://objective-audio.jp/2009/09/grand-central-dispatch-apply.html


  // https://developer.apple.com/library/ios/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationQueues/OperationQueues.html
  // serial ... known as  private queue
  // concurrent ... known as global dispatch queue

  dispatch_queue_t queue = dispatch_queue_create("jp.test.sample", DISPATCH_QUEUE_CONCURRENT);
  dispatch_apply(5, queue,^(size_t i) {
    sleep(rand() % 10);
    NSLog(@"非同期1_処理回数:%d",(int)i);
  });

  //非同期処理２
  for(int i = 0; i < 5; i++ ) {
    dispatch_async(queue,^{
      sleep(rand() % 3);
      NSLog(@"非同期２_処理回数:%d",(int)i);
    });
  }

  //非同期処理3
  for(int i = 0; i < 5; i++ ) {
    dispatch_async(queue, ^{
      sleep(rand() % 3);
      NSLog(@"非同期3_処理回数:%d",(int)i);
    });
  }

  //バリアされた非同期処理
  // ここで全部のqueueが終わるまで待つ <= ウソ
  // 処理は先に進む。ここでは　非同期4の処理に行く。
  // applyの処理が２スレッドまでなので止まっていたように見えた。
  // barrierは　ブロックの中身を　queueが終わってから実行する。
  dispatch_barrier_async(queue, ^{
    NSLog(@"dispatch_barrier_async");
  });

  //非同期処理4
  dispatch_apply(5, queue, ^(size_t i) {
    NSLog(@"非同期4_処理回数:%d",(int)i);
  });

  NSLog(@" finish ");

}

// dispatch group
-(void)gcdTest3 {

  dispatch_group_t group = dispatch_group_create(); // 1. dispatch group の生成

  // 非同期処理１
  dispatch_queue_t queue = dispatch_queue_create("jp.test.sample", DISPATCH_QUEUE_CONCURRENT);
  for(int i = 0; i < 5; i++) {
    dispatch_group_async(group, queue, ^{
      sleep(rand() % 3);
      NSLog(@"非同期1_処理回数:%d", (int)i);
    });
  }

  // 非同期処理2
  dispatch_queue_t queue2 = dispatch_queue_create("jp.test.sample2", DISPATCH_QUEUE_CONCURRENT);
  for(int i = 0; i < 5; i++) {
    dispatch_group_async(group, queue2, ^{
      sleep(rand() % 3);
      NSLog(@"非同期2_処理回数:%d", (int)i);
    });
  }

  // 3. タスクの終了まで待機
  dispatch_group_wait(group, DISPATCH_TIME_FOREVER);

  NSLog(@" finish ");

}



@end
