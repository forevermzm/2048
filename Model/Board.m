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

- ( instancetype ) initWithWidth:(NSUInteger)width Height:(NSUInteger)height
{
    self = [ super init ];
    if ( self ) {
        [ self setWidth: width];
        [ self setHeight: height];
        [ self setTiles:[[ NSMutableArray alloc] init]];
        for (NSInteger i = 0; i < _width * _height; i ++) {
            Tile *tile = [[Tile alloc] initWithNumber:0];
            [_tiles addObject:tile];
        }
        [ self setNumberOfRemainingSpots:width * height];
    }
    return self;
}

- ( void ) setTile:(Tile *)tile AtRemainingSpace:(NSUInteger)spaceIndex
{
    if ( spaceIndex >= self.numberOfRemainingSpots ) {
        [NSException raise:@"Index Out Of Bounds" format:@"Space Index is out of bound"];
    }
    for ( NSInteger i = 0; i < [self.tiles count] ; i ++ ) {
        Tile *tile = ( Tile *)[self.tiles objectAtIndex:i];
        if ( spaceIndex == 0 ){
            NSArray *rowAndColumn = [self getRowAndColumnFromIndex:i];
            [self setTile:tile
                    AtRow:[[rowAndColumn firstObject] integerValue]
                   Column:[[rowAndColumn objectAtIndex:1] integerValue]];
            break;
        }
        if ( tile.number == 0 ) {
            spaceIndex -= 1;
        }
    }
}

- ( void ) setTile:(Tile *) tile AtRow: (NSUInteger)row Column: (NSUInteger)column
{
    NSUInteger index = [self getIndexFromRow:row Column:column];
    [_tiles replaceObjectAtIndex:index withObject:tile];
    self.numberOfRemainingSpots -= 1;
}

- ( Tile * ) getTileAtRow: (NSUInteger) row Column: (NSUInteger) column
{
    NSUInteger index = [self getIndexFromRow:row Column:column];
    return [_tiles objectAtIndex:index];
}

#pragma mark Push_Board

- (void) pushRight
{
    // For each row, copy the whole row from left to right to a new array, perform
    // the action there, then copy it back.
    for (NSInteger row = 0; row < _height; row ++) {
        NSRange range = NSMakeRange(row * _width, _width);
        NSMutableArray *subArrayToBePushed = [[_tiles subarrayWithRange:range] mutableCopy];
        
        NSArray *result = [self pushLineToRight:[subArrayToBePushed reverseObjectEnumerator]
                                      withCount:[subArrayToBePushed count]];
        NSInteger column = _width - 1;
        for (Tile *tile in result) {
            [self setTile:tile AtRow:row Column:column];
            column -= 1;
        }
        for ( ; column >= 0 ; column --) {
            [self setTile:[[Tile alloc] initWithNumber:0] AtRow: row Column:column];
        }
    }
    [self calculateRemainingSpace];
}


- (void) pushLeft
{
    for (NSInteger row = 0; row < _height; row ++) {
        NSRange range = NSMakeRange(row * _width, _width);
        NSMutableArray *subArrayToBePushed = [[_tiles subarrayWithRange:range] mutableCopy];
        
        NSArray *result = [self pushLineToRight:[subArrayToBePushed objectEnumerator]
                                      withCount:[subArrayToBePushed count]];
        NSInteger column = 0;
        for (Tile *tile in result) {
            [self setTile:tile AtRow:row Column:column];
            column += 1;
        }
        for (; column < _width; column ++) {
            [self setTile:[[Tile alloc] initWithNumber:0] AtRow: row Column:column];
        }
    }
    [self calculateRemainingSpace];
}

- (void) pushUp
{
    for (NSInteger column = 0; column < _width; column ++) {
        NSMutableArray *columnArray = [[NSMutableArray alloc] init];
        for (NSInteger row = 0; row < _height; row ++) {
            [columnArray addObject:[self getTileAtRow:row Column:column]];
        }
        NSArray *result = [self pushLineToRight:[columnArray objectEnumerator]
                                      withCount:[columnArray count]];
        
        NSInteger row = 0;
        for (Tile *tile in result) {
            [self setTile:tile AtRow:row Column:column];
            row += 1;
        }
        for (; row < _height; row ++) {
            [self setTile:[[Tile alloc] initWithNumber:0] AtRow: row Column:column];
        }
    }
    [self calculateRemainingSpace];
}

- (void) pushDown
{
    for (NSInteger column = 0; column < _width; column ++) {
        NSMutableArray *columnArray = [[NSMutableArray alloc] init];
        for (NSInteger row = 0; row < _height; row ++) {
            [columnArray addObject:[self getTileAtRow:row Column:column]];
        }
        NSArray *result = [self pushLineToRight:[columnArray reverseObjectEnumerator]
                                      withCount:[columnArray count]];
        
        NSInteger row = _height - 1;
        for (Tile *tile in result) {
            [self setTile:tile AtRow:row Column:column];
            row -= 1;
        }
        for (; row >= 0; row --) {
            [self setTile:[[Tile alloc] initWithNumber:0] AtRow: row Column:column];
        }
    }
    [self calculateRemainingSpace];
}

- (void) print
{
    int index = 0;
    for (Tile *tile in _tiles) {
        printf("%lu ", tile.number);
        index ++;
        if (index % _width == 0) {
            printf("\n");
        }
    }
    printf("\n");
}

#pragma mark - Private_API

-(NSArray *) pushLineToRight: (NSEnumerator *)enumerator withCount: (NSInteger) count
{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    Tile *tile;
    while ( tile = [enumerator nextObject]) {
        if ( tile.number != 0 ) {
            [temp addObject:tile];
        }
    }
    tile = [[Tile alloc] initWithNumber:0];
    for (NSInteger i = [temp count]; i < count; i ++) {
        [temp addObject:tile];
    }
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < count - 1; i ++) {
        Tile *firstTile = [temp objectAtIndex:i];
        Tile *secondTile = [temp objectAtIndex:i + 1];
        if ( firstTile.number == secondTile.number ) {
            [result addObject:[[Tile alloc] initWithNumber:firstTile.number * 2]];
            i ++;
        } else {
            [result addObject:firstTile];
        }
    }
    
    return result;
}

- (void) calculateRemainingSpace
{
    NSInteger remainingSpaceCount = 0;
    for (Tile *tile in self.tiles) {
        if (tile.number == 0) {
            remainingSpaceCount ++;
        }
    }
    [self setNumberOfRemainingSpots:remainingSpaceCount];
}

#pragma mark Index_Swithing

- (NSUInteger) getIndexFromRow: (NSInteger) row Column: (NSInteger) column
{
    if ( row >= _height || column >= _width ) {
        [NSException raise:@"Index out of Bounds" format:@"Row %lu and Column %lu are invalid.",row ,column];
    }
    return row * _width + column;
}

- (NSArray *) getRowAndColumnFromIndex: ( NSInteger) index
{
    if ( index >= _height * _width ) {
        [NSException raise:@"Index out of Bounds" format:@"Index %lu is invalid.",index];
    }
    NSUInteger row = index / _width;
    NSUInteger column = index - row * _width;
    return @[[NSNumber numberWithInteger:row], [NSNumber numberWithInteger:column]];
}



















@end