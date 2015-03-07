//
//  manager.h
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/17.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^LoginCallBack)(NSString*);

@interface manager : NSObject
- (void)execute:(NSString*)string callback:(LoginCallBack)callback;
@end
