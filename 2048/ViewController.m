//
//  ViewController.m
//  2048
//
//  Created by MiZhemin on 5/24/15.
//  Copyright (c) 2015 MiZhemin. All rights reserved.
//

#import "ViewController.h"
#import "TileView.h"
#import "Grid.h"
#import "Game.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *boardView;

@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) Grid *grid;
@end

@implementation ViewController

- (void)setup
{
    NSInteger width = 6;
    NSInteger height = 6;
    self.game = [[Game alloc] initWithWidth:width Height:height];
    
    [self showBoard];
    
}

- (void) showBoard
{
    Board *board = self.game.board;
    [board print];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    // Do any additional setup after loading the view, typically from a nib.
    Grid *grid = [[Grid alloc] init];
    [grid setSize:self.boardView.bounds.size];
    [grid setCellAspectRatio:1.0];
    [grid setMinimumNumberOfCells:25];
    
    
    
//    CGRect viewRect = CGRectMake(10, 10, 100, 100);
    TileView *tileView = [[TileView alloc] initWithFrame:[grid resizedFrameOfCellAtRow:0
                                                                              inColumn:0
                                                                             withRatio:0.9]];
    TileView *anotherTileView = [[TileView alloc] initWithFrame:[grid resizedFrameOfCellAtRow:0
                                                                                     inColumn:1
                                                                                    withRatio:0.9]];
    [tileView setNumber:2];
    [anotherTileView setNumber:4];
    [self.boardView addSubview:tileView];
    [self.boardView addSubview:anotherTileView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
