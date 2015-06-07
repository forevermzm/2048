//
//  Game.m
//  2048
//
//  Created by MiZhemin on 5/25/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//

#import "Game.h"

@interface Game ()

@property (nonatomic, strong, readwrite) Board *board;
@property (nonatomic, readwrite) NSUInteger totalScore;
@property (nonatomic, readwrite) NSArray *directionArray;

@end

@implementation Game

#pragma mark - Public_api

-(instancetype) initWithWidth:(NSUInteger)width
                       Height:(NSUInteger)height
{
    self = [super init];
    if (self) {
        _board = [[Board alloc] initWithWidth:width
                                       Height:height];
        _totalScore = 0;
        _directionArray = @[@"Up", @"Right", @"Down", @"Left"];
    }
    return self;
}

- (void) pushTo:(NSString *)direction
{
    NSUInteger directionIndex = [_directionArray indexOfObject:direction];
    switch ( directionIndex ) {
        case 0:
            [_board pushUp];
            break;
        case 1:
            [_board pushRight];
            break;
        case 2:
            [_board pushDown];
            break;
        case 3:
            [_board pushLeft];
            break;
        default:
            [NSException raise:@"Direction is not found" format:@"Directorn is not found"];
    }
}

- (BOOL) isGameFinished
{
    return [_board numberOfRemainingSpots] == 0;
}

#pragma mark - Private_methods

-(void) putNewTile
{
    
}

@end










