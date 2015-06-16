//
//  AMoAdLayout.m
//  AMoAd
//
//  Created by AMoAd on 2015/06/12.
//

#import "AMoAdLayout.h"
#import "AMoAdLayoutConstraint.h"

@implementation AMoAdLayout

#pragma mark -- accessor method
/*!
 @abstract screenのサイズで縦横短いほうの値を返す
 @discussion adjust = YES のとき, 短い辺に合わせる。
   landscape にしたときに大きくなりすぎないようにする。
   iOS7とiOS8でboundsの挙動が違うのでシンプルに短いほうを取るようにした。
   http://iti.hatenablog.jp/entry/2014/09/19/113940
 */
-(CGFloat)shortSideScreenBounds {
    CGSize size = [[UIScreen mainScreen] bounds].size;
    return ( size.width < size.height ) ? size.width : size.height;
}


#pragma mark -- public method
-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                         adViewSize:(CGSize)adViewSize
                           isAdjust:(BOOL)isAdjust
                    horizontalAlign:(AMoAdHorizontalAlign)horizontalAlign
                      verticalAlign:(AMoAdVerticalAlign)verticalAlign
{
    return [self constraintsWithBaseView:baseView
                              targetView:targetView
                         horizontalAlign:horizontalAlign
                           verticalAlign:verticalAlign
                                isAdjust:isAdjust
                             adViewWidth:adViewSize.width
                            adViewHeight:adViewSize.height
                                       x:0
                                       y:0
            ];
}

-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                         adViewSize:(CGSize)adViewSize
                       adViewOrigin:(CGPoint)adViewOrigin
{
    return [self constraintsWithBaseView:baseView
                              targetView:targetView
                         horizontalAlign:AMoAdHorizontalAlignLeft
                           verticalAlign:AMoAdVerticalAlignTop
                                isAdjust:NO
                             adViewWidth:adViewSize.width
                            adViewHeight:adViewSize.height
                                       x:adViewOrigin.x
                                       y:adViewOrigin.y
            ];
}

-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                         adViewSize:(CGSize)adViewSize
                           isAdjust:(BOOL)isAdjust
{
    
    //    // 既存制約の優先度をLowにする
    //    for (NSLayoutConstraint* constraint in baseView.constraints) {
    //        constraint.priority = UILayoutPriorityDefaultLow;
    //    }
    
    [self removeConstraints:baseView];
    
    
    float adViewWidth = adViewSize.width;
    float adViewHeight = adViewSize.height;
    
    NSMutableArray* constraints = [@[] mutableCopy];
    
    // 横幅（固定）
    CGFloat viewWidth = isAdjust ? self.shortSideScreenBounds : adViewWidth;
    [constraints addObject:[AMoAdLayoutConstraint constraintWithItem:targetView
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1.f
                                                            constant:viewWidth]];
    
    // 高さ （アスペクト(縦横)比で指定）
    [constraints addObject:[AMoAdLayoutConstraint constraintWithItem:targetView
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:targetView
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:adViewHeight / adViewWidth
                                                            constant:0.0f]];
    
    
    // 追加する制約の優先度をHighにする
    for (NSLayoutConstraint* constraint in constraints) {
        constraint.priority = UILayoutPriorityRequired;
    }
    
    return constraints;
    
}

-(void)removeConstraints:(UIView *)baseView {
    for (id constraint in baseView.constraints) {
        if ([constraint isKindOfClass:[AMoAdLayoutConstraint class]]) {
            [baseView removeConstraint:constraint];
        }
    }
}

#pragma mark -- private method
-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                    horizontalAlign:(AMoAdHorizontalAlign)horizontalAlign
                      verticalAlign:(AMoAdVerticalAlign)verticalAlign
                           isAdjust:(BOOL)isAdjust
                        adViewWidth:(CGFloat)adViewWidth
                       adViewHeight:(CGFloat)adViewHeight
                                  x:(CGFloat)posX
                                  y:(CGFloat)posY
{
    
    // 既存制約の優先度をLowにする
    NSMutableArray* constraints = [@[] mutableCopy];
    
    // 横幅（固定）
    CGFloat viewWidth = isAdjust ? self.shortSideScreenBounds : adViewWidth;
    [constraints addObject:[AMoAdLayoutConstraint constraintWithItem:targetView
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1.f
                                                            constant:viewWidth]];
    
    // 高さ （アスペクト(縦横)比で指定）
    [constraints addObject:[AMoAdLayoutConstraint constraintWithItem:targetView
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:targetView
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:adViewHeight / adViewWidth
                                                            constant:0.0f]];
    
    // 横方向 align
    if( horizontalAlign == AMoAdHorizontalAlignLeft ) {
        // 左寄せ
        [constraints addObject:[AMoAdLayoutConstraint constraintWithItem:targetView
                                                               attribute:NSLayoutAttributeLeft
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:baseView
                                                               attribute:NSLayoutAttributeLeft
                                                              multiplier:1.f
                                                                constant:posX]];
    } else if( horizontalAlign == AMoAdHorizontalAlignRight ) {
        // 右寄せ
        [constraints addObject:[AMoAdLayoutConstraint constraintWithItem:targetView
                                                               attribute:NSLayoutAttributeRight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:baseView
                                                               attribute:NSLayoutAttributeRight
                                                              multiplier:1.f
                                                                constant:posX]];
    } else {
        //　中央寄せ
        [constraints addObject:[AMoAdLayoutConstraint constraintWithItem:targetView
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:baseView
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.f
                                                                constant:posX]];
        
    }
    
    // 縦方向 align
    if (verticalAlign == AMoAdVerticalAlignTop) {
        // 上寄せ
        [constraints addObject:[AMoAdLayoutConstraint constraintWithItem:targetView
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:baseView
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.f
                                                                constant:posY]];
        
    } else if (verticalAlign == AMoAdVerticalAlignCenter) {
        // 中央寄せ
        [constraints addObject:[AMoAdLayoutConstraint constraintWithItem:targetView
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:baseView
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1.f
                                                                constant:posY]];
        
    } else {
        // 下寄せ
        [constraints addObject:[AMoAdLayoutConstraint constraintWithItem:targetView
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:baseView
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.f
                                                                constant:posY]];
        
    }
    
    for (NSLayoutConstraint* constraint in constraints) {
        constraint.priority = UILayoutPriorityDefaultHigh;
    }
    
    return constraints;
    
}

@end
