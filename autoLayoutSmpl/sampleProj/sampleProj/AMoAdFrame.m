//
//  AMoAdFrame.m
//  sampleProj
//
//  Created by 島田 武史 on 2015/06/16.
//  Copyright (c) 2015年 島田 武史. All rights reserved.
//

#import "AMoAdFrame.h"
#import "ContentView.h"
#import "AMoAdLayout.h"

@implementation AMoAdFrame


- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.2];
    }
    return self;

}

-(void)addContentView
{

    ContentView *contentview = [[ContentView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    [self addSubview:contentview];
    
    AMoAdLayout *layout = [[AMoAdLayout alloc] initWithBaseView:self targetView:contentview adViewSize:contentview.frame.size adViewOrigin:self.frame.origin];
                           
    [self addConstraints:layout.constraints];

    NSLog(@"%@", contentview);
    NSLog(@"%@", self);
    
}



@end
