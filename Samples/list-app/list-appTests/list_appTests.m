//
//  list_appTests.m
//  list-appTests
//
//  Created by Gustavo on 7/15/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface list_appTests : XCTestCase

@end

@implementation list_appTests

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
