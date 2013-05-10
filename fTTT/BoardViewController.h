//
//  BoardViewController.h
//  fTTT
//
//  Created by Nathan Walker on 4/11/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Board.h"
#import "BoardSquare.h"
#import "NewGameViewController.h"
#import "Square.h"
#import "TicTacToeInteractor.h"

@interface BoardViewController : UIViewController <Board>

@property (strong, nonatomic) TicTacToeInteractor *interactor;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (strong, nonatomic) NSArray *squares;
@property (strong, nonatomic) IBOutlet UILabel *currentPlayerLabel;

- (IBAction)touchSquare:(id)sender;
- (void)alertGameOver;
- (NSArray *)buttonsToSquares:(NSArray *)buttons;
- (void)newGameView;

@end
