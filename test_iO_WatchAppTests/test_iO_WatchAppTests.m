//
//  test_iO_WatchAppTests.m
//  test_iO_WatchAppTests
//
//  Created by Yannik Zimmermann on 30.03.15.
//  Copyright (c) 2015 Yannik Zimmermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface test_iO_WatchAppTests : XCTestCase

@end

@implementation test_iO_WatchAppTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
