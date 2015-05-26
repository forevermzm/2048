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

// Designated Initializer.
- ( instancetype ) initWithWidth: (NSUInteger) width Height: (NSUInteger) height;

- ( void ) setTile: (Tile *) tile AtRow: (NSUInteger) row Column: (NSUInteger) column;
- ( Tile * ) getTileAtRow: (NSUInteger) row Column: (NSUInteger) column;

@end
