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
  self.board = [MockBoardViewController new];
  self.interactor = [[TicTacToeInteractor alloc] initWithGame:self.game withBoard:self.board];
}

- (void)moveToSquare:(NSString *)square {
  [self.interactor doMove:[square intValue]];
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
  return self.board.gameOverAlertCalled;
}

- (void)tapNewGame:(NSString *)opponent {
  [self.interactor newGame:opponent];
}

- (NSString *)currentPlayer {
  return self.board.currentPlayerString;
}

@end
