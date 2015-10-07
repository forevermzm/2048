//
//  BoardTesting.m
//  2048
//
//  Created by MiZhemin on 10/4/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Board.h"

@interface BoardTesting : XCTestCase

@end

@implementation BoardTesting

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

- (void) testEquals
{
    Board *board1 = [[ Board alloc] initWithWidth:6 Height:6];
    Board *board2 = [[ Board alloc] initWithWidth:6 Height:6];
    XCTAssert( [ board1 isEqual:board2 ] );
}

@end
