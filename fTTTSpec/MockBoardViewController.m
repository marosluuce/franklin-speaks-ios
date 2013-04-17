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
  }
  
  return self;
}

- (void)alertGameOver {
  self.gameOverAlertCalled = YES;
}

@end
