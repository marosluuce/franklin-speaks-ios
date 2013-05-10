//
//  BoardSquare.m
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "BoardSquare.h"

@interface BoardSquare()

@property (strong, nonatomic) UIColor *XColor;
@property (strong, nonatomic) UIColor *OColor;

@end

@implementation BoardSquare

- (id)initWithButton:(UIButton *)button {
  if (self = [super init]) {
    self.button = button;
    self.XColor = [UIColor colorWithRed:64/255.0 green:114/255.0 blue:154/255.0 alpha:1.0];
    self.OColor = [UIColor colorWithRed:238/255.0 green:72/255.0 blue:59/255.0 alpha:1.0];
  }
  
  return self;
}

- (void)setValue:(NSString *)value {
  [self setColorBasedOnSymbol:value];
  [self.button setTitle:value forState:UIControlStateNormal & UIControlStateSelected & UIControlStateHighlighted];
}

- (void)setColorBasedOnSymbol:(NSString *)symbol {
  UIColor *color;
  if ([[symbol lowercaseString] isEqualToString:@"x"]) {
    color = self.XColor;
  }
  else {
    color = self.OColor;
  }
  
  [self.button setTitleColor:color forState:UIControlStateNormal & UIControlStateSelected & UIControlStateHighlighted];
}

// Who calls this?
- (NSString *)value {
  return self.button.currentTitle;
}

// Or this?
- (int)number {
  return self.button.tag;
}

@end
