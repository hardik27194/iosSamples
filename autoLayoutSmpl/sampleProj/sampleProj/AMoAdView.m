[//
//  AMoAdView.m
//  sampleProj
//
//  Created by 島田 武史 on 2015/06/16.
//  Copyright (c) 2015年 島田 武史. All rights reserved.
//

#import "AMoAdView.h"
#import "AMoAdFrame.h"

@interface AMoAdView ()
@property (nonatomic, strong) AMoAdFrame *amoadFrame;
@end

@implementation AMoAdView


-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2];
        
        [self addview];
    }
    return self;
}


-(void)addview
{
    self.amoadFrame = [[AMoAdFrame alloc] initWithFrame:CGRectZero];
    [self addSubview:self.amoadFrame];
    

    AMoAdLayout *layout = [[AMoAdLayout alloc] init];
    NSArray *constraints = [layout adjustConstraintsWithBaseView:self targetView:self.amoadFrame];
    [self addConstraints:constraints];
    
    
    NSLog(@"%@", self);
    NSLog(@"%@", constraints);
    NSLog(@"%@", self.amoadFrame);
    
//    amoadFrame.frame = CGRectMake(0, 0, 100, 100);
    
//    ContentView *contentView = [[ContentView alloc] initWithFrame:CGRectZero];
//    [amoadFrame addSubview:contentView];

    NSLog(@"%@", self.constraints);

}

-(void)temp1
{
    
//    AMoAdLayout* layout =
//    [[AMoAdLayout alloc] initWithBaseView:self.superview
//                               targetView:self
//                               adViewSize:CGSizeMake(320, 50)
//                                 isAdjust:YES
//                          horizontalAlign:AMoAdHorizontalAlignCenter
//                            verticalAlign:AMoAdVerticalAlignBottom];
//    // 座標
//    AMoAdLayout* layout2 =
//    [[AMoAdLayout alloc] initWithBaseView:self.superview
//                               targetView:self
//                               adViewSize:CGSizeMake(320, 50)
//                             adViewOrigin:CGPointMake(100, 100)];
//    
//    // 制約追加
//    [self.superview addConstraints:layout2.constraints];
//    

    
    [self.amoadFrame addContentView];

}



@end
