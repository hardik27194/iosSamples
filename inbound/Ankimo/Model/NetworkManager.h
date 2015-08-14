//
//  NetworkManager.h
//  Ankimo
//
//  Created by takeshi on 2015/08/03.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject
+ (instancetype)sharedManager;

-(NSDictionary *)jsonParse;

-(void)temp1;


@end
