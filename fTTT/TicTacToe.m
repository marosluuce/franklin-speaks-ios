//
//  TicTacToe.m
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "TicTacToe.h"

@implementation TicTacToe

- (id)initWithCommunicator:(id <Communicator>)communicator {
  if (self = [super init]) {
    self.communicator = communicator;
    self.squares = @[@"", @"", @"", @"", @"", @"", @"", @"", @""];
    self.winner = @"";
    self.gameover = NO;
    self.currentplayer = @"";
  }
  
  return self;
}

- (void)communicate:(NSDictionary *)message {
  NSDictionary *result = [self.communicator communicate:message];
  [self updateGame:result];
}

- (void)updateGame:(NSDictionary *)result {
  self.squares = [result objectForKey:@"squares"];
  self.winner = [result objectForKey:@"winner"];
  self.gameover = [[result objectForKey:@"gameover"] boolValue];
  self.currentplayer = [result objectForKey:@"currentplayer"];
}

- (NSString *)squareIs:(int)square {
  return [self.squares objectAtIndex:square - 1];
}

- (BOOL)isDraw {
  return self.gameover && [self.winner isEqualToString:@""];
}

@end
