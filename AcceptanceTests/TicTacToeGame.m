//
//  TicTacToeGame.m
//  fTTT
//
//  Created by Nathan Walker on 4/10/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "TicTacToeGame.h"

@implementation TicTacToeGame

- (void)launch {
  id <Communicator> communicator = [MockCommunicator new];
  self.game = [[TicTacToe alloc] initWithCommunicator:communicator];
  self.view = [MockBoardViewController new];
  self.interactor = [[TicTacToeInteractor alloc] initWithGame:self.game withView:self.view];
}

- (void)moveToSquare:(NSString *)square {
  [self.interactor doMove:[square intValue] withView: self.view];
}

- (NSString *)squareIs:(NSString *)square {
  return [self.game squareIs:[square intValue]];
}

- (NSString *)winnerIs {
  return self.game.winner;
}

- (BOOL)gameIsDraw {
  return [self.game isDraw];
}

- (BOOL)gameOverAlertShows {
  return self.view.gameOverAlertCalled;
}

- (void)tapNewGame {
  [self.interactor newGame:self.view];
}

- (NSString *)currentPlayer {
  return self.view.currentPlayerString;
}

@end
