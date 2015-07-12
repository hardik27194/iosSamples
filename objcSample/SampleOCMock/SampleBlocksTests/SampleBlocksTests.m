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

#import "sampleManager.h"

@interface sampleManager(expose)
-(void)sampleMethod1;
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

- (void)testExample {
    
//    id mock = [OCMockObject mockForClass:[sampleManager class]];
    
    sampleManager *manager = [sampleManager sharedInstance];
    id mock = [OCMockObject partialMockForObject:manager];

    
    [[[mock expect] andDo:nil] sampleMethod1]; // このメソッドを通ることを期待する
    
    [mock sampleMethod];
    
    [mock verify]; // 確認実行
    
}

@end
