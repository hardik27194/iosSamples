//
//  ViewController.m
//  sampleProj
//
//  Created by 島田 武史 on 2015/06/09.
//  Copyright (c) 2015年 島田 武史. All rights reserved.
//

#import "ViewController.h"
#import "AMOLayoutConstraint.h"


@interface ViewController ()
@property (nonatomic, strong) UIView* childView;
@property (nonatomic, copy) NSMutableArray* constraints;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.3];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect buttonRect = CGRectMake(100, 100, 100, 30);
    button.frame = buttonRect;
    [button setTitle:@"but" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(removeCon) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];

    
    
    CGRect childFrame = CGRectMake(10, 200, 200, 50);
    UIView* childView = [[UIView alloc] initWithFrame:childFrame];
    childView.translatesAutoresizingMaskIntoConstraints = NO;
    childView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:childView];

    self.childView = childView;

    AMOLayoutConstraint * constraint = [[AMOLayoutConstraint alloc] init];

    // align
    NSArray* constraints =
    [constraint constraintsWithBaseView:self.view
                             targetView:childView
                             adViewSize:CGSizeMake(320, 50)
                               isAdjust:YES
                        horizontalAlign:AMOHorizontalAlignCenter
                          verticalAlign:AMOVerticalAlignBottom];

    // 座標
    NSArray* constraints2 =
    [constraint constraintsWithBaseView:self.view
                             targetView:childView
                             adViewSize:CGSizeMake(320, 50)
                           adViewOrigin:CGPointMake(100, 100)];
    
    // 制約追加
    [self.view addConstraints:constraints];
    
}

-(void)removeCon {
    AMOLayoutConstraint * constraint = [[AMOLayoutConstraint alloc] init];
    [constraint removeConstraints:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
