//
//  AMoAdLayout.h
//  AMoAd
//
//  Created by AMoAd on 2015/06/12.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, AMoAdVerticalAlign) {
    AMoAdVerticalAlignTop = 0,
    AMoAdVerticalAlignCenter,
    AMoAdVerticalAlignBottom,
};


typedef NS_ENUM(NSInteger, AMoAdHorizontalAlign) {
    AMoAdHorizontalAlignLeft = 0,
    AMoAdHorizontalAlignCenter,
    AMoAdHorizontalAlignRight,
};


/*!
 @class NSString
 @superclass NSObject
 @discussion 広告の表示位置・サイズをAutoLayoutを使用して設定する
 */
@interface AMoAdLayout : NSObject

/*!
 @abstract 水平方向、垂直方向で指定
 @param baseView 元のview
 @param targetView 広告のview
 @param adViewSize 広告のサイズ
 @param isAdjust サイズの横幅をFitさせるか
 @param horizontalAlign 水平方向 左寄せ、中央寄せ、右寄せ
 @param verticalAlign 垂直方向　上寄せ、中央寄せ、下寄せ
 @return 制約のリスト
 */
-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                         adViewSize:(CGSize)adViewSize
                           isAdjust:(BOOL)isAdjust
                    horizontalAlign:(AMoAdHorizontalAlign)horizontalAlign
                      verticalAlign:(AMoAdVerticalAlign)verticalAlign;

/*!
 @abstract x,y座標で指定
 @param baseView 元のview
 @param targetView 広告のview
 @param adViewSize 広告のサイズ
 @return 制約のリスト
 */
-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                         adViewSize:(CGSize)adViewSize
                       adViewOrigin:(CGPoint)adViewOrigin;

/*!
 @abstract 他(xibなど）で制約を与えている場合に仕様する。
 @discussion サイズの制約は内部で上書きする
 @param baseView 元のview
 @param targetView 広告のview
 @param adViewSize 広告のサイズ
 @param isAdjust サイズの横幅をFitさせるか
 @return 制約のリスト
 */
-(NSArray *)constraintsWithBaseView:(UIView *)baseView
                         targetView:(UIView *)targetView
                         adViewSize:(CGSize)adViewSize
                           isAdjust:(BOOL)isAdjust;

/*!
 @abstract 制約を削除
 @discussion 当クラス（AMoAdLayoutConstraint）で作成された制約だけ削除する
 @param baseView 元のview
 */
-(void)removeConstraints:(UIView *)baseView;


@end
