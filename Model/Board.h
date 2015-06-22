//
//  Board.h
//  2048
//
//  Created by MiZhemin on 5/25/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"

@interface Board : NSObject

// Width and height are in number of piles.
@property ( nonatomic, readonly ) NSUInteger width;
@property ( nonatomic, readonly ) NSUInteger height;
@property ( nonatomic, readonly ) NSUInteger numberOfRemainingSpots;

// Designated Initializer.
- ( instancetype ) initWithWidth: (NSUInteger) width
                          Height: (NSUInteger) height;

- ( void ) setTile: (Tile *) tile
             AtRow: (NSInteger) row
            Column: (NSInteger) column;

- ( void ) setTile: (Tile *) tile
  AtRemainingSpace: (NSInteger) spaceIndex;

- ( Tile * ) getTileAtRow: (NSInteger) row
                   Column: (NSInteger) column;

- (void) pushRight;
- (void) pushLeft;
- (void) pushUp;
- (void) pushDown;

// Should be test only.
- (void) print;

@end
