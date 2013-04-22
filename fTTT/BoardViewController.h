//
//  BoardViewController.h
//  fTTT
//
//  Created by Nathan Walker on 4/11/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BoardView.h"
#import "BoardSquare.h"
#import "Square.h"
#import "TicTacToeInteractor.h"

@interface BoardViewController : UIViewController <BoardView>

@property (strong, nonatomic) TicTacToeInteractor *interactor;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (strong, nonatomic) NSArray *squares;

- (IBAction)touchSquare:(id)sender;
- (void)alertGameOver;
- (NSArray *)buttonsToSquares:(NSArray *)buttons;

@end
