//
//  Board.m
//  2048
//
//  Created by MiZhemin on 5/24/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject

// Width and height are in number of piles. 
@property ( nonatomic, readonly ) NSUInteger width;
@property ( nonatomic, readonly ) NSUInteger height;

// Designated Initializer.
- ( instancetype ) initWithWidth: (NSUInteger) width Height: (NSUInteger) height;

@end

@interface Board ()

@property ( nonatomic, readwrite ) NSUInteger width;
@property ( nonatomic, readwrite ) NSUInteger height;

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

@end