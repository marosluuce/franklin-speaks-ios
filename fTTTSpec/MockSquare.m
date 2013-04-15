//
//  MockSquare.m
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "MockSquare.h"

@implementation MockSquare

- (id)init {
  if (self = [super init]) {
    self.squareValue = @"";
    self.squareNumber = 1;
  }
    
  return self;
}

- (void)setValue:(NSString *)value {
  self.squareValue = value;
}

- (NSString *)value {
  return self.squareValue;
}

- (int)number {
  return self.squareNumber;
}

@end
