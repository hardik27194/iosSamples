//
//  sampleCell.m
//  SampleBlocks
//
//  Created by takeshi on 2015/06/03.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import "SampleCell.h"

@implementation SampleCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
    }
    return self;

}


@end
