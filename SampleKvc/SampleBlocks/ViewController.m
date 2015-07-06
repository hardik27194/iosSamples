//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "ViewController.h"
#import "SampleClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.2];

    SampleClass *sc = [[SampleClass alloc] init];
    id string = [sc valueForKey:@"string1"];
    NSLog(@"%@", (NSString *)string);

    id fl1 = [sc valueForKey:@"fl1"];
    NSLog(@"%@", fl1);

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
