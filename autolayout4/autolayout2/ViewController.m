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
@property (nonatomic, weak) IBOutlet UIView* AMoAdView;
@property (nonatomic, weak) IBOutlet UIView* AMoAdFrame;
@property (nonatomic, weak) IBOutlet UIView* contentView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {

    
//    [self adjust:self.view targetView:self.baseView];
    
    
    self.baseView.translatesAutoresizingMaskIntoConstraints = NO;
    self.AMoAdView.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat padding = 10;

    NSMutableArray *constraints = [@[] mutableCopy];
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.AMoAdView
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.baseView
                                                        attribute:NSLayoutAttributeLeading
                                                       multiplier:1.f
                                                         constant:padding]];

    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.baseView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.AMoAdView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.f
                                                         constant:padding]];

    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.baseView
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.AMoAdView
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.f
                                                         constant:padding]];
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.AMoAdView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.baseView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.f
                                                         constant:padding]];
    
    
    [self.baseView addConstraints:constraints];

    

//    [self adjust:self.baseView targetView:self.AMoAdView];

//    [self adjust:self.AMoAdView targetView:self.AMoAdFrame];
    
//    [self adjust:self.AMoAdFrame targetView:self.contentView];
//    
//    [self settingWidht:self.contentView];
    
    
}

-(void)settingWidht:(UIView*)targetView {
    
    NSMutableArray *constraints = [@[] mutableCopy];
    
    // 横幅（固定）
    [constraints addObject:[NSLayoutConstraint constraintWithItem:targetView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                        multiplier:1.f
                                                          constant:320]];
    
    // 高さ （アスペクト(縦横)比で指定）
    [constraints addObject:[NSLayoutConstraint constraintWithItem:targetView
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:targetView
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:50 / 320
                                                          constant:0.0f]];
    [targetView addConstraints:constraints];
    
}


-(void)adjust:(UIView*)baseView targetView:(UIView*)targetView {

    CGFloat padding = 10;
    
    NSMutableArray *constraints = [@[] mutableCopy];
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:targetView
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:baseView
                                                         attribute:NSLayoutAttributeLeading
                                                        multiplier:1.f
                                                          constant:padding]];

    [constraints addObject:[NSLayoutConstraint constraintWithItem:targetView
                                                         attribute:NSLayoutAttributeTrailing
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:baseView
                                                         attribute:NSLayoutAttributeTrailing
                                                        multiplier:1.f
                                                          constant:padding]];

    [constraints addObject:[NSLayoutConstraint constraintWithItem:targetView
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:baseView
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.f
                                                          constant:padding]];

    [constraints addObject:[NSLayoutConstraint constraintWithItem:targetView
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:baseView
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.f
                                                          constant:padding]];

    [baseView addConstraints:constraints];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
