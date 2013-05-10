//
//  NewGameViewController.h
//  fTTT
//
//  Created by Nathan Walker on 5/2/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TicTacToeInteractor.h"
#import "Board.h"
#import "BoardViewController.h"

//Why does this work?
@class BoardViewController;

@interface NewGameViewController : UIViewController

@property (strong, nonatomic) TicTacToeInteractor *interactor;
@property (strong, nonatomic) BoardViewController *board;

- (id)initControllerAndInteractor;
- (id)initWithInteractor:(TicTacToeInteractor *) interactor;
- (void)newGameWithOpponent:(NSString *)opponent;
- (IBAction)newGameWithHuman:(id)sender;
- (IBAction)newGameWithEasyAI:(id)sender;
- (IBAction)newGameWithHardAI:(id)sender;

@end
