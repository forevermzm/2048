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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *boardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Grid *grid = [[Grid alloc] init];
    [grid setSize:self.boardView.bounds.size];
    [grid setCellAspectRatio:1.0];
    [grid setMinimumNumberOfCells:25];
    
    
    
//    CGRect viewRect = CGRectMake(10, 10, 100, 100);
    TileView *tileView = [[TileView alloc] initWithFrame:[grid frameOfCellAtRow:0 inColumn:0]];
    [tileView setNumber:2];
    [self.boardView addSubview:tileView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
