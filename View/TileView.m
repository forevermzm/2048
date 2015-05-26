//
//  TileView.m
//  2048
//
//  Created by MiZhemin on 5/24/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//

#import "TileView.h"

@implementation TileView

- (void) setNumber:(NSUInteger)number
{
    _number = number;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [[UIImage imageNamed:[NSString stringWithFormat:@"%lu", (unsigned long)_number]] drawInRect:self.bounds];
}


#pragma mark - Initialization

- (void)setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


@end
