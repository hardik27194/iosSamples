//
//  SampleThread.m
//  SampleBlocks
//
//  Created by 島田 武史 on 2015/07/02.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import "SampleThread.h"
#import "BackGroundTask.h"

@interface SampleThread(){
}
@property (strong, nonatomic) BackGroundTask *operation;
@property (strong, nonatomic) NSOperationQueue *queue;
@end

@implementation SampleThread


- (instancetype)init {
  if (self = [super init]) {
    self.operation = [[BackGroundTask alloc] init];
    self.queue     = [[NSOperationQueue alloc] init];
  }
  return self;
}

- (void)performMethod {
  [self.operation addObserver:self
                   forKeyPath:@"isFinished"
                      options:NSKeyValueObservingOptionNew
                      context:nil];

  [self.queue addOperation:self.operation];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {

  NSLog(@"%@", [change description]);


  // キー値監視を解除する
  [object removeObserver:self forKeyPath:keyPath];
  
}


@end
