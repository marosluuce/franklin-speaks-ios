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
    self.squares = [[NSMutableArray alloc] initWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", nil];
  }
  
  return self;
}

- (NSDictionary *)communicate:(NSDictionary *)dict {
  int index = [[dict objectForKey:@"square"] intValue] - 1;
  [self.squares setObject:[self flipFlopXO] atIndexedSubscript:index];
  return @{@"squares": self.squares,
           @"winner": [self winner],
           @"gameover": [NSNumber numberWithBool:[self gameover]],
          };
}

- (NSString *)flipFlopXO {
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

@end
