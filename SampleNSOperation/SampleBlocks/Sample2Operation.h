//
//  SampleTask.h
//  SampleBlocks
//
//  Created by 島田 武史 on 2015/07/02.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sample2Operation : NSOperation {

@private
  BOOL isExecuting;
  BOOL isFinished;

}

@property int idx;
@end
