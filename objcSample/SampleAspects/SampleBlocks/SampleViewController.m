//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "SampleViewController.h"
#import "sample1View.h"

@interface SampleViewController ()

@end

@implementation SampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:1 alpha:0.2];

    
    sample1View* sample1 = [[sample1View alloc] init];
    sample1.frame = CGRectMake(100,100,100,100);
    sample1.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:0.1];
    [sample1 setupSubviews];
    
    [self.view addSubview:sample1];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
