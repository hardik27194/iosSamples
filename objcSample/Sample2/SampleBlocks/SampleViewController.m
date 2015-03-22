//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "SampleViewController.h"
#import "ExampleObject.h"

@interface SampleViewController ()

@end

@implementation SampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:1 alpha:0.2];
    
    ExampleObject *exampleObject = [[ExampleObject alloc] init];
    [exampleObject exec];
    
}

@end
