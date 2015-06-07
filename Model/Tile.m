//
//  Tile.m
//  2048
//
//  Created by MiZhemin on 5/24/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//

#import "Tile.h"

@implementation Tile

- ( instancetype ) initWithNumber: (NSUInteger) number
{
    self = [ super init ];
    if (self) {
        [self setNumber:number];
    }
    return self;
}

@end
