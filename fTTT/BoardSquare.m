//
//  BoardSquare.m
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "BoardSquare.h"

@implementation BoardSquare

- (id)initWithButton:(UIButton *)button {
  if (self = [super init]) {
    self.button = button;
  }
  
  return self;
}

- (void)setValue:(NSString *)value {
  value = [value uppercaseString];
  [self.button setTitle:value forState:UIControlStateNormal & UIControlStateSelected & UIControlStateHighlighted];
}

- (NSString *)value {
  return self.button.titleLabel.text;
}

- (int)number {
  return self.button.tag;
}

@end
