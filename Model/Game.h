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

// This method is for the gestures.
- (void) pushTo: (NSString *) direction;

// This method should generate a new tile of either 2 or 4 and put in a remaining space.
- (void) putRandomTileInBoard;

-(BOOL) isGameFinished;

@end
