//
//  MockBoardViewController.m
//  fTTT
//
//  Created by Nathan Walker on 4/17/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "MockBoardViewController.h"

@implementation MockBoardViewController 

- (id)init {
  if (self = [super init]) {
    self.gameOverAlertCalled = NO;
    self.squares = [self createSquares];
  }
  
  return self;
}

- (void)alertGameOver {
  self.gameOverAlertCalled = YES;
}

- (NSArray *)createSquares {
  NSMutableArray *squares = [[NSMutableArray alloc] init];
  
  for (int i = 1; i < 10; i++) {
    MockSquare *square = [[MockSquare alloc] init];
    square.squareNumber = i;
    [squares addObject:square];
  }
  
  return squares;
}

@end
