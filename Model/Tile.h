//
//  Tile.h
//  2048
//
//  Created by MiZhemin on 5/25/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//


#import <Foundation/Foundation.h>

// Public methods and attributes
@interface Tile : NSObject

@property (nonatomic, readwrite) NSUInteger number;

- ( instancetype ) initWithNumber: (NSUInteger) number;

@end