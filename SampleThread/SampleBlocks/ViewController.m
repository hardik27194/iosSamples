//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "ViewController.h"
#import "SampleThread.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.2];

  SampleThread *st = [[SampleThread alloc] init];
  [st sampleThread];

}


@end
