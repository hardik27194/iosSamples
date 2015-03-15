//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "SampleViewController.h"
#import "sample1View.h"
#import "UIImageView+Action.h"


@interface SampleViewController ()

@end

@implementation SampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:1 alpha:0.2];

    
//    sample1View* sample1 = [[sample1View alloc] init];
//    sample1.frame = CGRectMake(0,0,300,300);
//    sample1.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:0.1];
//    [sample1 setupSubviews];
//    [self.view addSubview:sample1];
    
//    UIImage *img = [self imageWithColor:[UIColor redColor]];

    UIImage *img = [UIImage imageNamed:@"apple-touch-icon-114x114"];
    
    UIImageView *iv = [[UIImageView alloc] initWithImage:img];
    iv.center = CGPointMake(200, 200);
    [iv setImageViewPressedBlock:^(){
        
        NSLog(@"test dayo-nn");
        NSLog(@"test dayo-nn");
        NSLog(@"test dayo-nn");
        NSLog(@"test dayo-nn");
        
    }];
    
    [self.view addSubview:iv];
    
    
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
