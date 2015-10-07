//
//  Tile.m
//  2048
//
//  Created by MiZhemin on 5/24/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//

#import "Tile.h"

@implementation Tile

#pragma mark - Override

-(BOOL)isEqual:(id)object
{
    if ( [object isKindOfClass: [self class]] )
    {
        Tile *otherTile = ( Tile * ) object;
        return _number == otherTile.number;
    } else
    {
        return FALSE;
    }
}

- (NSUInteger) hash
{
    NSUInteger prime = 31;
    NSUInteger result = 1;
    
    result = prime * result + _number;
    
    return result;
}

#pragma mark - public methods

- ( instancetype ) initWithNumber: (NSUInteger) number
{
    self = [ super init ];
    if (self) {
        [self setNumber:number];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat: @"Tile is: %lu", (unsigned long)_number];
}

@end
