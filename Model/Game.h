//
//  Game.h
//  2048
//
//  Created by MiZhemin on 5/25/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"

@interface Game : NSObject

@property (nonatomic, strong, readonly) NSArray *directionArray;
@property (nonatomic, strong, readonly) Board *board;
@property (nonatomic, readonly) NSUInteger totalScore;

-(instancetype) initWithWidth: (NSUInteger) width
                       Height: (NSUInteger) height;

// These methods are for the gestures.
- (void) pushTo: (NSString *) direction;


-(BOOL) isGameFinished;

@end
