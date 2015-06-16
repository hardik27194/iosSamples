//
//  ViewController.m
//  sampleProj
//
//  Created by 島田 武史 on 2015/06/09.
//  Copyright (c) 2015年 島田 武史. All rights reserved.
//

#import "ViewController.h"
#import "AMoAdView.h"

@interface ViewController ()
@property (nonatomic, strong) UIView* childView;
@property (nonatomic, copy) NSMutableArray* constraints;
@property (nonatomic, strong) AMoAdView *amoAdView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.3];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect buttonRect = CGRectMake(100, 100, 100, 30);
    button.frame = buttonRect;
    [button setTitle:@"but" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addcon) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];

    
    CGRect frame = CGRectMake(10, 200, 200, 50);
    self.amoAdView = [[AMoAdView alloc] initWithFrame:frame];
    self.amoAdView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.amoAdView];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
