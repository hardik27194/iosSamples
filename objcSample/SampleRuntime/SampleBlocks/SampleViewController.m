//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import <objc/runtime.h>
#import "SampleViewController.h"

@interface SampleViewController ()

@end

@implementation SampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:1 alpha:0.2];

    
    float BUFFER_SIZE = 10.0f;
    
    
    // 取得する値は、この変数に格納します。
    UILabel* result;
    
    // 変数名を組み立てるバッファーを確保します。BUFFER_SIZE は必要なサイズを自分で決めておきます。
    char* attributeName = (char*)malloc(BUFFER_SIZE);
    
    // 変数名を C 文字列で組み立てます。ここの index には ラベル番号が指定されているものとします。
    snprintf(attributeName, BUFFER_SIZE, "label%d", index);
    
    // 自分のインスタンス (self) から、先ほどの文字列で指定したインスタンス変数を取得します。
    Ivar ivar = class_getInstanceVariable(object_getClass(self), attributeName);
    
    
    
    
}




//指定したUIColorでCGRectの大きさを塗り潰したUIImageを返す
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(50.0f, 150.0f, 200.0f, 200.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
