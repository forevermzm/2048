//
//  Board.m
//  2048
//
//  Created by MiZhemin on 5/24/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//

#import "Board.h"

@interface Board ()

@property ( nonatomic, readwrite ) NSUInteger width;
@property ( nonatomic, readwrite ) NSUInteger height;
@property ( nonatomic, readwrite ) NSUInteger numberOfRemainingSpots;
@property ( nonatomic, strong ) NSMutableArray *tiles;

@end

@implementation Board

#pragma mark - Public_api

#pragma mark - Index_Swithing

- ( instancetype ) initWithWidth:(NSUInteger)width Height:(NSUInteger)height
{
    self = [ super init ];
    if ( self ) {
        [ self setWidth: width];
        [ self setHeight: height];
        [ self setNumberOfRemainingSpots:width * height];
    }
    return self;
}

- (NSUInteger) getIndexFromRow: (NSUInteger) row Column: (NSUInteger) column
{
    if ( row >= _height || column >= _width ) {
        [NSException raise:@"Index out of Bounds" format:@"Row %lu and Column %lu are invalid.",row ,column];
    }
    return row * _width + column;
}

- (NSArray *) getColumnAndRowFromIndex: ( NSUInteger) index
{
    if ( index >= _height * _width ) {
        [NSException raise:@"Index out of Bounds" format:@"Index %lu is invalid.",index];
    }
    NSUInteger row = index / _width;
    NSUInteger column = index - row * _width;
    return @[[NSNumber numberWithInteger:row], [NSNumber numberWithInteger:column]];
}

- ( void ) setTile:(Tile *) tile AtRow: (NSUInteger)row Column: (NSUInteger)column
{
    NSUInteger index = [self getIndexFromRow:row Column:column];
    [_tiles replaceObjectAtIndex:index withObject:tile];
}

- ( Tile * ) getTileAtRow: (NSUInteger) row Column: (NSUInteger) column
{
    NSUInteger index = [self getIndexFromRow:row Column:column];
    return [_tiles objectAtIndex:index];
}

#pragma mark - Push_Board

- (void) pushRight
{
    // For each row, copy the whole row from left to right to a new array, perform
    // the action there, then copy it back.
    for (NSInteger row = 0; row < _height; row ++) {
        NSRange range = NSMakeRange(row * _width, _width);
        NSMutableArray *subArrayToBePushed = [[_tiles subarrayWithRange:range] mutableCopy];
        
        [self pushLineToRight:subArrayToBePushed];
       
    }
}


- (void) pushLeft
{
    
}

- (void) pushUp
{
    
}

- (void) pushDown
{
    
}

#pragma mark - Private_API

-(NSArray *) pushLineToRight: (NSMutableArray *)line
{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    NSEnumerator *enumerator = [line reverseObjectEnumerator];
    Tile *tile;
    while ( tile = [enumerator nextObject]) {
        if ( tile.number != 0 ) {
            [temp addObject:tile];
        }
    }
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < [temp count] - 1; i ++) {
        Tile *firstTile = [temp objectAtIndex:i];
        Tile *secondTile = [temp objectAtIndex:i + 1];
        if ( firstTile.number == secondTile.number ) {
            [result addObject:[[Tile alloc] initWithNumber:firstTile.number * 2]];
            i ++;
        }
    }
    
    return result;
}






















@end