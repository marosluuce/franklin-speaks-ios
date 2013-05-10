//
//  TicTacToeInteractor.m
//  fTTT
//
//  Created by Nathan Walker on 4/18/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "TicTacToeInteractor.h"

@implementation TicTacToeInteractor

+ (id)newInteractorWithGame:(id<Board>)board {
  NSURL *url = [NSURL URLWithString:@"http://localhost:5000"];
//  NSURL *url = [NSURL URLWithString:@"http://10.0.0.33:5000"];
  HttpConnector *connector = [HttpConnector new];
  ServerCommunicator *communicator = [[ServerCommunicator alloc] initWithUrl:url andWithConnector:connector];
  TicTacToe *game = [[TicTacToe alloc] initWithCommunicator:communicator];
  
  return [[TicTacToeInteractor alloc] initWithGame:game withBoard:board];
}

- (id)initWithGame:(TicTacToe *)game withBoard:(id<Board>)board {
  if (self = [super init]) {
    self.game = game;
    self.board = board;
  }
  
  return self;
}

- (void)updateView {
  [self updateSquares:self.board.squares];
  [self.board setCurrentPlayer:self.game.currentplayer];
  
  if (self.game.gameover) {
    [self.board alertGameOver];
  }
}

- (NSString *)gameOverMessage {
  NSString *message = @"";
  
  if ([self.game isDraw]) {
    message = @"Draw!";
  }
  else if (self.game.gameover == YES) {
    message = [NSString stringWithFormat:@"%@ Won!", [self.game.winner uppercaseString]];
  }
  
  return message;
}

- (void)updateSquares:(NSArray *)squares {
  for (id <Square> square in squares) {
    [square setValue:[self.game squareIs:square.number]];
  }
}

- (void)doMove:(int)square {
  NSDictionary *message = @{@"square": [@(square) description]};
  [self.game communicate:message];
  [self updateView];
}

- (void)newGame:(NSString *) opponent {
  [self.game communicate:@{@"newgame": opponent}];
  [self updateView];
}

@end
