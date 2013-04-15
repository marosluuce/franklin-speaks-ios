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

- (void)updateWithMove:(int)square {
  NSDictionary *result = [self makeMove:square];
  self.squares = [result objectForKey:@"squares"];
}

- (NSString *)squareIs:(int)square {
  return [self.squares objectAtIndex:square - 1];
}

- (void)updateSquare:(id<Square>)square {
  [self updateWithMove:[square number]];
  [square setValue:[self squareIs:square.number]];
}

@end
