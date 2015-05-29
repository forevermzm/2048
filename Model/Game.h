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

@property (nonatomic, strong, readonly) Board *board;

@end
