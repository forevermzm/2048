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
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;
@end

@implementation ViewController

#pragma mark - SetUp Methods

- (void)setup
{
    _width = GAME_WIDTH;
    _height = GAME_HEIGHT;
    [self setupGame];
    [self setupGrid];
    [self setupGestureRecognizer];
    
    [self showBoard];
    
}

- (void)setupGame
{
    self.game = [[Game alloc] initWithWidth:_width Height:_height];
}

- (void)setupGrid
{
    _grid = [[Grid alloc] init];
    [_grid setSize:self.boardView.bounds.size];
    [_grid setCellAspectRatio:1.0];
    [_grid setMinimumNumberOfCells:_width * _height];
}

- (void)setupGestureRecognizer
{
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.boardView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.boardView addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(didSwipe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.boardView addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.boardView addGestureRecognizer:swipeDown];
}

- (void)didSwipe:(UISwipeGestureRecognizer*)swipe{
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self.game pushTo:@"Left"];
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        [self.game pushTo:@"Right"];
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        [self.game pushTo:@"Up"];
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        [self.game pushTo:@"Down"];
    }
    [self showBoard];
}

#pragma mark - Utilities Methods

- (void) showBoard
{
    Board *board = self.game.board;
    for (int i = 0 ; i < _width; i ++ ) {
        for (int j = 0 ; j < _height; j ++ ) {
            Tile *tile = [board getTileAtRow:i Column:j];
            TileView *tileView = [[TileView alloc] initWithFrame:[_grid resizedFrameOfCellAtRow:i
                                                                                   inColumn:j
                                                                                  withRatio:0.9]];
            [tileView setNumber:tile.number];
            [self.boardView addSubview:tileView];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
