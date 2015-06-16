//
//  AMOLayoutConstraint.m
//  sampleProj
//
//  Created by AmoAd on 2015/06/12.
//  Copyright (c) 2015年 島田 武史. All rights reserved.
//

#import "AMOLayoutConstraint.h"

@implementation AMOLayoutConstraint

#pragma mark -- accessor method
/*
 * @abstract screenのサイズで縦横短いほうの値を返す
 * @discussion adjust = YES のとき, 短い辺に合わせる。
 landscape にしたときに大きくなりすぎないようにする。
 iOS7とiOS8でboundsの挙動が違うのでシンプルに短いほうを取るようにした。
 http://iti.hatenablog.jp/entry/2014/09/19/113940
 */
-(CGFloat)shortSideScreenBounds {
    CGSize size = [[UIScreen mainScreen] bounds].size;
    return ( size.width < size.height ) ? size.width : size.height;
}


#pragma mark -- parts
-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                         adViewSize:(CGSize)adViewSize
                           isAdjust:(BOOL)isAdjust
                    horizontalAlign:(HorizontalAlign)horizontalAlign
                      verticalAlign:(VerticalAlign)verticalAlign
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
                         horizontalAlign:HorizontalAlignLeft
                           verticalAlign:VerticalAlignTop
                                isAdjust:NO
                             adViewWidth:adViewSize.width
                            adViewHeight:adViewSize.height
                                       x:adViewOrigin.x
                                       y:adViewOrigin.y
            ];
}


-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                    horizontalAlign:(HorizontalAlign)horizontalAlign
                      verticalAlign:(VerticalAlign)verticalAlign
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
    [constraints addObject:[AMOLayoutConstraint constraintWithItem:targetView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                        multiplier:1.f
                                                          constant:viewWidth]];
    
    // 高さ （アスペクト(縦横)比で指定）
    [constraints addObject:[AMOLayoutConstraint constraintWithItem:targetView
                                                        attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:targetView
                                                        attribute:NSLayoutAttributeWidth
                                                       multiplier:adViewHeight / adViewWidth
                                                         constant:0.0f]];
    
    // 横方向 align
    if( horizontalAlign == HorizontalAlignLeft ) {
        // 左寄せ
        [constraints addObject:[AMOLayoutConstraint constraintWithItem:targetView
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:baseView
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.f
                                                             constant:posX]];
    } else if( horizontalAlign == HorizontalAlignRight ) {
        // 右寄せ
        [constraints addObject:[AMOLayoutConstraint constraintWithItem:targetView
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:baseView
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1.f
                                                             constant:posX]];
    } else {
        //　中央寄せ
        [constraints addObject:[AMOLayoutConstraint constraintWithItem:targetView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:baseView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1.f
                                                             constant:posX]];
        
    }
    
    // 縦方向 align
    if (verticalAlign == VerticalAlignTop) {
        // 上寄せ
        [constraints addObject:[AMOLayoutConstraint constraintWithItem:targetView
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:baseView
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1.f
                                                             constant:posY]];
        
    } else if (verticalAlign == VerticalAlignCenter) {
        // 中央寄せ
        [constraints addObject:[AMOLayoutConstraint constraintWithItem:targetView
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:baseView
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1.f
                                                             constant:posY]];
        
    } else {
        // 下寄せ
        [constraints addObject:[AMOLayoutConstraint constraintWithItem:targetView
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
    [constraints addObject:[AMOLayoutConstraint constraintWithItem:targetView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                        multiplier:1.f
                                                          constant:viewWidth]];
    
    // 高さ （アスペクト(縦横)比で指定）
    [constraints addObject:[AMOLayoutConstraint constraintWithItem:targetView
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
        if ([constraint isKindOfClass:[AMOLayoutConstraint class]]) {
            [baseView removeConstraint:constraint];
        }
    }
}


#pragma mark -- snipet 
//
//-(void)temp1 {
//    
//    
//    NSArray* constraints =
//    @[
//      
//      [NSLayoutConstraint constraintWithItem:self.childView
//                                   attribute:NSLayoutAttributeLeft
//                                   relatedBy:NSLayoutRelationEqual
//                                      toItem:self.view
//                                   attribute:NSLayoutAttributeLeft
//                                  multiplier:1.f constant:50.0f],
//      
//      [NSLayoutConstraint constraintWithItem:self.childView
//                                   attribute:NSLayoutAttributeRight
//                                   relatedBy:NSLayoutRelationEqual
//                                      toItem:self.view
//                                   attribute:NSLayoutAttributeRight
//                                  multiplier:1.f constant:-50.0f],
//      
//      [NSLayoutConstraint constraintWithItem:self.childView
//                                   attribute:NSLayoutAttributeTop
//                                   relatedBy:NSLayoutRelationEqual
//                                      toItem:self.view
//                                   attribute:NSLayoutAttributeTop
//                                  multiplier:1.f constant:150.0f],
//      
//      [NSLayoutConstraint constraintWithItem:self.childView
//                                   attribute:NSLayoutAttributeBottom
//                                   relatedBy:NSLayoutRelationEqual
//                                      toItem:self.view
//                                   attribute:NSLayoutAttributeBottom
//                                  multiplier:1.f constant:-150.0f]
//      ];
//    
//    
//    NSArray* constraints2 =
//    @[
//      [AMOLayoutConstraint constraintWithItem:self.childView
//                                    attribute:NSLayoutAttributeBottom
//                                    relatedBy:NSLayoutRelationEqual
//                                       toItem:self.view
//                                    attribute:NSLayoutAttributeBottom
//                                   multiplier:1.f constant:-250.0f]
//      ];
//    
//    for (NSLayoutConstraint* constraint in constraints){
//        constraint.priority = UILayoutPriorityDefaultHigh;
//    }
//    
//    for (NSLayoutConstraint* constraint in constraints2){
//        constraint.priority = UILayoutPriorityDefaultLow;
//    }
//    
//    NSLayoutConstraint* constraint3 = [[NSLayoutConstraint alloc] init];
//    constraint3.priority = UILayoutPriorityFittingSizeLevel;
//    
//    
//    
//    [self.view addConstraints:constraints2];
//    //    [self.view addConstraints:constraints];
//    
//    for (NSLayoutConstraint* constraint in self.view.constraints){
//        NSLog(@" priority %f " , constraint.priority );
//        if ([constraint isKindOfClass:[AMOLayoutConstraint class]]) {
//            NSLog(@"hjkl;:");
//            
//        }
//    }
//    
//    
//    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    CGRect buttonRect = CGRectMake(100, 100, 100, 30);
//    button.frame = buttonRect;
//    [button setTitle:@"but" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(hoge) forControlEvents:UIControlEventTouchDown];
//    [self.view addSubview:button];
//    
//    
//    NSInteger cnt = [self.view.constraints count];
//    NSLog(@" cnt %ld", cnt );
//    
//    [self showConstraintDataWithConstrains:self.view.constraints];
//    
//    
//    NSLog(@"stop ");
//    
//    
//    
//}
//
//-(void)hoge {
//    
//    NSInteger cnt = [self.view.constraints count];
//    NSLog(@" cnt %ld", cnt );
//    
//    
//    NSLog(@"hoge");
//    
//    /*
//     for (NSLayoutConstraint* constraint in self.constraints) {
//     [self.view removeConstraint:constraint];
//     NSInteger cnt = [self.view.constraints count];
//     NSLog(@" cnt %ld", cnt );
//     
//     }
//     */
//    
//    
//    cnt = [self.view.constraints count];
//    
//    //    [self.view removeConstraints:self.view.constraints];
//    
//    
//    
//    for (NSLayoutConstraint* constraint in self.view.constraints){
//        NSLog(@" priority %f " , constraint.priority );
//        if ([constraint isKindOfClass:[AMOLayoutConstraint class]]) {
//            NSLog(@"hjkl;:");
//        }
//    }
//    
//    
//    [self performSelector:@selector(hoge2) withObject:nil afterDelay:1.0f];
//    
//    [self showConstraintDataWithConstrains:self.view.constraints];
//    
//    
//}
//
//-(void)hoge2 {
//    
//    
//    for (NSLayoutConstraint* constraint in self.view.constraints){
//        NSLog(@" priority %f " , constraint.priority );
//        if ([constraint isKindOfClass:[AMOLayoutConstraint class]]) {
//            [self.view removeConstraint:constraint];
//        }
//    }
//    
//    
//    
//    NSLog(@"before constraints count %ld ", [self.view.constraints count] );
//    //
//    //
//    //    self.constraints
//    //    = @[
//    //        [NSLayoutConstraint constraintWithItem:self.childView
//    //                                     attribute:NSLayoutAttributeLeft
//    //                                     relatedBy:NSLayoutRelationEqual
//    //                                        toItem:self.view
//    //                                     attribute:NSLayoutAttributeLeft
//    //                                    multiplier:1.f constant:50.0f],
//    //
//    //        [NSLayoutConstraint constraintWithItem:self.childView
//    //                                     attribute:NSLayoutAttributeRight
//    //                                     relatedBy:NSLayoutRelationEqual
//    //                                        toItem:self.view
//    //                                     attribute:NSLayoutAttributeRight
//    //                                    multiplier:1.f constant:-50.0f],
//    //
//    //        [NSLayoutConstraint constraintWithItem:self.childView
//    //                                     attribute:NSLayoutAttributeTop
//    //                                     relatedBy:NSLayoutRelationEqual
//    //                                        toItem:self.view
//    //                                     attribute:NSLayoutAttributeTop
//    //                                    multiplier:1.f constant:150.0f],
//    //
//    //        [NSLayoutConstraint constraintWithItem:self.childView
//    //                                     attribute:NSLayoutAttributeBottom
//    //                                     relatedBy:NSLayoutRelationEqual
//    //                                        toItem:self.view
//    //                                     attribute:NSLayoutAttributeBottom
//    //                                    multiplier:1.f constant:-250.0f]
//    //        ];
//    //
//    
//    NSArray* constraints2 =
//    @[
//      [AMOLayoutConstraint constraintWithItem:self.childView
//                                    attribute:NSLayoutAttributeBottom
//                                    relatedBy:NSLayoutRelationEqual
//                                       toItem:self.view
//                                    attribute:NSLayoutAttributeBottom
//                                   multiplier:1.f constant:-250.0f]
//      ];
//    
//    
//    //    [self.view addConstraints:self.constraints];
//    [self.view addConstraints:constraints2];
//    
//    
//    
//    NSLog(@"after constraints count %ld ", [self.view.constraints count] );
//    
//    [self showConstraintDataWithConstrains:self.view.constraints];
//    
//    
//     for (NSLayoutConstraint* constraint in self.view.constraints){
//     if (constraint.priority == UILayoutPriorityDefaultLow) {
//     [self.view removeConstraint:constraint];
//     break;
//     }
//     }
//    
//    
//    
//    NSLog(@"-------------------");
//    
//    [self showConstraintDataWithConstrains:self.view.constraints];
//    
//    
//}
//
//-(void)showConstraintDataWithConstrains:(NSArray*)constraints{
//    
//    for (NSLayoutConstraint* constraint in constraints){
//        NSLog(@"-------------------");
//        NSLog(@" pointer %@ ",constraint);
//        NSLog(@" pointer %p ",constraint);
//        NSLog(@"   priority %f " , constraint.priority);
//        
//    }
//    
//}
//
//


@end
