//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.2];


  [self temp1];

}

-(void)temp1{

  NSArray *sameArray = @[@"h1",@"h2",@"h3",@"h4",@"h5"];

  id obj1 = sameArray[2];

  NSLog(@"a1 %p", sameArray);

  int64_t delayInSeconds = 2.0;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    id obj = sameArray[2];
    NSLog(@"a2 %p", sameArray);
  });

}


@end
