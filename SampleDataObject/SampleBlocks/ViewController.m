//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "ViewController.h"
#import "DataObject.h"
#import "SampleManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.2];

    DataObject *DO = [[DataObject alloc] init];
    DO.UserId = @"user1";
    DO.Password = @"password";
    

    SampleManager *SM = [[SampleManager alloc] init];
    [SM execute:DO];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
