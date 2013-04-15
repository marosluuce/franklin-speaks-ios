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
  return @{@"squares": self.squares};
}

- (NSString *)flipFlopXO {
  int count = 0;
  for (NSString *value in self.squares) {
    count += [value isEqualToString:@""];
  }
  NSLog(@"%d", count);
  return count % 2 == 1 ? @"X" : @"O";
}

@end
