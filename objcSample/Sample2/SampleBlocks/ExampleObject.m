//
//  TempObject.h
//
//  Created by takeshi on 2015/03/18.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

#import "ExampleObject.h"
#import <objc/Object.h>

@interface SampleClass : NSObject
-(void)sampleMethod;
@end

@implementation SampleClass
-(void)sampleMethod
{


    NSString *methodName = NSStringFromSelector(_cmd);
    NSLog(@"  methodName:%@" , methodName);
    
    NSLog(@"exec methodA");
}
@end

@implementation ExampleObject
-(void)exec
{
    
    id obj = [SampleClass new];
    SEL method = @selector(sampleMethod);
    IMP func = [obj methodForSelector:method];
    func();

    NSString *methodName = NSStringFromSelector(_cmd);
    NSLog(@"  methodName:%@" , methodName);

}
@end
