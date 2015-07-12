//
//  sampleManager.h
//  SampleBlocks
//
//  Created by takeshi on 2015/05/21.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sampleManager : NSObject
+(sampleManager *)sharedInstance;
-(void)sampleMethod;
@end
