//
//  TicTacToeInteractor.m
//  fTTT
//
//  Created by Nathan Walker on 4/18/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "TicTacToeInteractor.h"

@implementation TicTacToeInteractor

+ (id)newInteractorWithGame:(id <BoardView>)view {
  NSURL *url = [NSURL URLWithString:@"http://localhost:5000"];
//  NSURL *url = [NSURL URLWithString:@"http://10.0.1.36:5000"];
  HttpConnector *connector = [HttpConnector new];
  ServerCommunicator *communicator = [[ServerCommunicator alloc] initWithUrl:url andWithConnector:connector];
  TicTacToe *game = [[TicTacToe alloc] initWithCommunicator:communicator];
  
  return [[TicTacToeInteractor alloc] initWithGame:game withView:view];
}

- (id)initWithGame:(TicTacToe *)game withView:(id<BoardView>)view {
  if (self = [super init]) {
    self.game = game;
    [self newGame:view];
  }
  
  return self;
}

- (void)updateView:(id <BoardView>)view {
  [self updateSquares:view.squares];
  
  if (self.game.gameover) {
    [view alertGameOver];
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

- (void)doMove:(int)square withView:(id <BoardView>)view {
  NSDictionary *message = @{@"square": [@(square) description]};
  [self.game communicate:message];
  [self updateView:view];
}

- (void)newGame:(id<BoardView>)view {
  [self.game communicate:@{@"newgame": @"true"}];
  [self updateView:view];
}

@end
