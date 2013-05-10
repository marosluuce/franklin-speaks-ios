//
//  MockCommunicator.m
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "MockCommunicator.h"

#import "Communicator.h"

@implementation MockCommunicator

- (id)init {
  if (self = [super init]) {
    [self newGame];
    self.lastRequest = nil;
  }
  
  return self;
}

- (NSDictionary *)communicate:(NSDictionary *)dict {
  self.lastRequest = dict;
  
  if ([dict objectForKey:@"square"]) {
    int square = [[dict objectForKey:@"square"] intValue] - 1;
    if ([[self.squares objectAtIndex:square] isEqualToString:@""]) {
      [self move:square];
      if ([self.opponent isEqualToString:@"easy_ai"]) {
        [self move:[self easyAI]];
      }
      else if ([self.opponent isEqualToString:@"hard_ai"]) {
        [self move:[self hardAI]];
      }
    }
  }
  else if ([dict objectForKey:@"newgame"]) {
    [self newGame];
    self.opponent = [dict objectForKey:@"newgame"];
  }
  return [self gameState];
}

- (void)move:(int)square {
  [self.squares setObject:[self currentPlayer] atIndexedSubscript:square];
}

- (void)undoMove:(int)square {
  [self.squares setObject:@"" atIndexedSubscript:square];
}

- (NSString *)currentPlayer {
  int count = 0;
  for (NSString *value in self.squares) {
    count += [value isEqualToString:@""];
  }
    
  return count % 2 == 1 ? @"X" : @"O";
}

- (NSString *)winner {
  NSArray *toCheck = @[@[@0, @1, @2],
                       @[@3, @4, @5],
                       @[@6, @7, @8],
                       @[@0, @3, @6],
                       @[@1, @4, @7],
                       @[@2, @5, @8],
                       @[@0, @4, @8],
                       @[@2, @4, @6]];
  
  for (NSArray *combo in toCheck) {
    NSNumber *nOne = [combo objectAtIndex:0];
    NSNumber *nTwo = [combo objectAtIndex:1];
    NSNumber *nThree = [combo objectAtIndex:2];
    
    NSString *one = [self.squares objectAtIndex:[nOne intValue]];
    NSString *two = [self.squares objectAtIndex:[nTwo intValue]];
    NSString *three = [self.squares objectAtIndex:[nThree intValue]];
        
    if (![one isEqualToString:@""] &&
         [one isEqualToString:two] &&
         [one isEqualToString:three]) {
      return one;
    }
  }
  
  return @"";
}

- (BOOL)full {
  int count = 0;
  for (NSString *value in self.squares) {
    count += [value isEqualToString:@""];
  }
  
  return count == 0;
}

- (BOOL)gameover {
  return [self full] || ![[self winner] isEqualToString:@""];
}

- (void)newGame {
  self.squares = [[NSMutableArray alloc] initWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", nil];
}

- (NSDictionary *)gameState {
  return @{@"squares": self.squares,
           @"winner": [self winner],
           @"gameover": [NSNumber numberWithBool:[self gameover]],
           @"currentplayer": [NSString stringWithFormat:@"Player %@", [self currentPlayer]],
          };
}

- (NSArray *)availableSquares {
  NSMutableArray *available = [NSMutableArray new];
  for (int i = 0; i < self.squares.count; i++) {
    NSString *value = [self.squares objectAtIndex:i];
    if ([value isEqualToString:@""]) {
      [available addObject:[NSNumber numberWithInt:i]];
    }
  }
  return available;
}

- (int)easyAI {
  return [[[self availableSquares] objectAtIndex:0] intValue];
}

- (int)score {
  if ([[self winner] isEqualToString:@""]) {
    return 0;
  }
  else if ([[self winner] isEqualToString:[self currentPlayer]]) {
    return 1;
  }
  else {
    return -1;
  }
}

- (int)hardAI {
  if ([[self.squares objectAtIndex:4] isEqualToString:@""]) {
    return 4;
  }

  int move = -1;
  int value = -999;
  
  for (NSNumber *number in [self availableSquares]) {
    int square = [number intValue];
    [self move:square];
    
    int score = -1 * [self hardAIHelper];
    if (score > value) {
      value = score;
      move = square;
    }
    
    [self undoMove:square];
  }
  
  return move;
}

- (int)hardAIHelper {
  if ([self gameover]) {
    return [self score];
  }
  
  int value = -999;
  
  for (NSNumber *number in [self availableSquares]) {
    int square = [number intValue];
    [self move:square];
    
    int score = -1 * [self hardAIHelper];
    if (score > value) {
      value = score;
    }
    
    [self undoMove:square];
  }
  return value;
}

@end
