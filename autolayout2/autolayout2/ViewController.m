//
//  ViewController.m
//  autolayout2
//
//  Created by 島田 武史 on 2015/06/15.
//  Copyright (c) 2015年 島田 武史. All rights reserved.
//

#import "ViewController.h"
#import "AMOLayoutConstraint.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIView* baseView;
@property (nonatomic, weak) IBOutlet UIView* childView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {

    AMOLayoutConstraint * constraint = [[AMOLayoutConstraint alloc] init];

    NSArray* constraints =
    [constraint constraintsWithBaseView:self.baseView
                             targetView:self.childView
                             adViewSize:CGSizeMake(320, 50)
                               isAdjust:YES
                        horizontalAlign:HorizontalAlignCenter
                          verticalAlign:VerticalAlignBottom];

    

    NSArray* constraints2 =
    [constraint constraintsWithBaseView:self.baseView
                             targetView:self.childView
                             adViewSize:CGSizeMake(320, 50)
                               isAdjust:YES];

    
    
    [self.baseView addConstraints:constraints2];

    
    NSLog(@" %@ ", self.baseView.constraints);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
