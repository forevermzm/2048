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
@property ( nonatomic, strong ) NSMutableArray *tiles;

@end

@implementation Board

- ( instancetype ) initWithWidth:(NSUInteger)width Height:(NSUInteger)height
{
    self = [ super init ];
    if ( self ) {
        [ self setWidth: width];
        [ self setHeight:height];
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

@end