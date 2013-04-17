//
//  TicTacToe.m
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "TicTacToe.h"

@implementation TicTacToe

- (id)initWithCommunicator:(id<Communicator>)communicator {
  if (self = [super init]) {
    self.communicator = communicator;
    self.squares = @[@"", @"", @"", @"", @"", @"", @"", @"", @""];
    self.winner = @"";
    self.gameover = NO;
  }
  
  return self;
}

- (NSDictionary *)makeMove:(int)square {
  return [self.communicator communicate:[self formatMove:square]];
}

- (NSDictionary *)formatMove:(int)square {
  NSString *string = [NSString stringWithFormat:@"%d", square];
  return @{@"square": string};
}

- (void)moveAndUpdateGame:(int)square {
  if (!self.gameover) {
    NSDictionary *result = [self makeMove:square];
    self.squares = [result objectForKey:@"squares"];
    self.winner = [result objectForKey:@"winner"];
    self.gameover = [[result objectForKey:@"gameover"] boolValue];
  }
}

- (NSString *)squareIs:(int)square {
  return [self.squares objectAtIndex:square - 1];
}

- (void)updateSquare:(id<Square>)square {
  [self moveAndUpdateGame:[square number]];
  [square setValue:[self squareIs:square.number]];
}

- (NSString *)gameOverMessage {
  NSString *message = @"";
  
  if (self.gameover == YES && [self.winner isEqualToString:@""]) {
    message = @"Draw!";
  }
  else if (self.gameover == YES) {
    message = [NSString stringWithFormat:@"%@ Won!", [self.winner uppercaseString]];
  }
  
  return message;
}

- (void)updateView:(id <BoardView>)view {
  if (self.gameover) {
    [view alertGameOver];
  }
}

@end
