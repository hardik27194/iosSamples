//
//  SampleBlocksTests.m
//  SampleBlocksTests
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "SampleManager.h"
#import "SampleObject.h"

@interface SampleManager(expose)
-(void)execute2;
@end

@interface SampleBlocksTests : XCTestCase

@end

@implementation SampleBlocksTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample1 {

//    SampleObject *obj = [[SampleObject alloc] init];
    
    id mock = [OCMockObject mockForClass:[SampleObject class]];
    
    
    
//    [[[mock expect] andDo:^(NSInvocation* invocation){}] execute1];
    [[mock expect] execute1];
//    [[mock expect] execute2];
    
//    SampleObject *obj = [[SampleObject alloc] init];
//    [obj execute1];
    
    
    [mock execute1];
    
    [mock verify];
    
}

- (void)testExample {

    SampleManager *manager = [SampleManager sharedInstance];

    id mock = [OCMockObject partialMockForObject:manager];
//    [[[mock expect] andDo:nil] execute2];
    [[[mock expect] andForwardToRealObject] execute2];
    
    [mock execute1];
    [mock verify];
    
    
}



@end
