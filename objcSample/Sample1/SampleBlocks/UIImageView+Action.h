//
//  UIImageView+Action.h
//  SampleBlocks
//
//  Created by takeshi on 2015/03/15.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^basicBlock)(void);

@interface UIImageView (Action)
@property (copy, nonatomic) basicBlock imageViewPressedBlock;
@end
