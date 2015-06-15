//
//  AMOLayoutConstraint.h
//  sampleProj
//
//  Created by 島田 武史 on 2015/06/12.
//  Copyright (c) 2015年 島田 武史. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, VerticalAlign) {
    VerticalAlignTop = 0,
    VerticalAlignCenter,
    VerticalAlignBottom,
};

typedef NS_ENUM(NSInteger, HorizontalAlign) {
    HorizontalAlignLeft = 0,
    HorizontalAlignCenter,
    HorizontalAlignRight,
};

@interface AMOLayoutConstraint : NSLayoutConstraint

// alignで指定
-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                         adViewSize:(CGSize)adViewSize
                           isAdjust:(BOOL)isAdjust
                    horizontalAlign:(HorizontalAlign)horizontalAlign
                      verticalAlign:(VerticalAlign)verticalAlign;


// x,y座標で指定
-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                         adViewSize:(CGSize)adViewSize
                       adViewOrigin:(CGPoint)adViewOrigin;


// 他(xibなど）で制約を与えている場合はその制約を生かす。
// しかし　幅だけは　制約をかける
-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                         adViewSize:(CGSize)adViewSize
                           isAdjust:(BOOL)isAdjust;


// 制約を削除  AMOLayoutConstraint の制約だけ削除
-(void)removeConstraints:(UIView *)baseView;


@end
