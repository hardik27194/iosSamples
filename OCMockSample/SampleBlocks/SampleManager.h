//
//  SampleManager.h
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/17.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SampleManager : NSObject
+ (SampleManager*)sharedInstance;
-(void)execute1;
@end
