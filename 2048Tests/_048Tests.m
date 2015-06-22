//
//  _048Tests.m
//  2048Tests
//
//  Created by MiZhemin on 5/24/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Board.h"

@interface _048Tests : XCTestCase

@end

@implementation _048Tests

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

#pragma mark --Test Methods

- (void)testBoardPushRight
{
    Board *board = [[Board alloc] initWithWidth:5 Height:5];
    XCTAssertEqual(25, [board numberOfRemainingSpots]);
    
    // First row
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:0 Column:2];
    XCTAssertEqual(24, [board numberOfRemainingSpots]);
    
    // Second row
    [board setTile:[[Tile alloc] initWithNumber:4] AtRow:1 Column:0];
    [board setTile:[[Tile alloc] initWithNumber:4] AtRow:1 Column:2];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:1 Column:3];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:1 Column:4];
    XCTAssertEqual(20, [board numberOfRemainingSpots]);
    
    // Third row
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:2 Column:0];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:2 Column:2];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:2 Column:4];
    XCTAssertEqual(17, [board numberOfRemainingSpots]);
    
    [board pushRight];
    
    XCTAssertEqual(2, [board getTileAtRow:0 Column:4].number);
    
    XCTAssertEqual(8, [board getTileAtRow:1 Column:3].number);
    XCTAssertEqual(4, [board getTileAtRow:1 Column:4].number);
    
    XCTAssertEqual(2, [board getTileAtRow:2 Column:3].number);
    XCTAssertEqual(4, [board getTileAtRow:2 Column:4].number);
    
    XCTAssertEqual(20, [board numberOfRemainingSpots]);
}

- (void)testBoardPushLeft
{
    Board *board = [[Board alloc] initWithWidth:5 Height:5];
    
    // First row
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:0 Column:2];
    XCTAssertEqual(24, [board numberOfRemainingSpots]);
    
    // Second row
    [board setTile:[[Tile alloc] initWithNumber:4] AtRow:1 Column:0];
    [board setTile:[[Tile alloc] initWithNumber:4] AtRow:1 Column:2];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:1 Column:3];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:1 Column:4];
    XCTAssertEqual(20, [board numberOfRemainingSpots]);
    
    // Third row
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:2 Column:0];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:2 Column:2];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:2 Column:4];
    XCTAssertEqual(17, [board numberOfRemainingSpots]);
    
    [board pushLeft];
    
    XCTAssertEqual(2, [board getTileAtRow:0 Column:0].number);
    
    XCTAssertEqual(8, [board getTileAtRow:1 Column:0].number);
    XCTAssertEqual(4, [board getTileAtRow:1 Column:1].number);
    
    XCTAssertEqual(4, [board getTileAtRow:2 Column:0].number);
    XCTAssertEqual(2, [board getTileAtRow:2 Column:1].number);
    XCTAssertEqual(20, [board numberOfRemainingSpots]);
}

- (void)testBoardPushUp
{
    Board *board = [[Board alloc] initWithWidth:5 Height:5];
    
    // First Column
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:2 Column:0];
    
    // Second Column
    [board setTile:[[Tile alloc] initWithNumber:4] AtRow:0 Column:1];
    [board setTile:[[Tile alloc] initWithNumber:4] AtRow:2 Column:1];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:3 Column:1];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:4 Column:1];

    // Thrid column
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:0 Column:2];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:2 Column:2];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:4 Column:2];
    
    [board pushUp];
    
    XCTAssertEqual(2, [board getTileAtRow:0 Column:0].number);
    
    XCTAssertEqual(8, [board getTileAtRow:0 Column:1].number);
    XCTAssertEqual(4, [board getTileAtRow:1 Column:1].number);
    
    XCTAssertEqual(4, [board getTileAtRow:0 Column:2].number);
    XCTAssertEqual(2, [board getTileAtRow:1 Column:2].number);
    XCTAssertEqual(20, [board numberOfRemainingSpots]);
}

- (void)testBoardPushDown
{
    Board *board = [[Board alloc] initWithWidth:5 Height:5];
    
    // First Column
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:2 Column:0];
    
    // Second Column
    [board setTile:[[Tile alloc] initWithNumber:4] AtRow:0 Column:1];
    [board setTile:[[Tile alloc] initWithNumber:4] AtRow:2 Column:1];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:3 Column:1];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:4 Column:1];
    
    // Thrid column
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:0 Column:2];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:2 Column:2];
    [board setTile:[[Tile alloc] initWithNumber:2] AtRow:4 Column:2];
    
    [board pushDown];
    
    XCTAssertEqual(2, [board getTileAtRow:4 Column:0].number);
    
    XCTAssertEqual(8, [board getTileAtRow:3 Column:1].number);
    XCTAssertEqual(4, [board getTileAtRow:4 Column:1].number);
    
    XCTAssertEqual(4, [board getTileAtRow:4 Column:2].number);
    XCTAssertEqual(2, [board getTileAtRow:3 Column:2].number);
    
    XCTAssertEqual(20, [board numberOfRemainingSpots]);
}

@end
