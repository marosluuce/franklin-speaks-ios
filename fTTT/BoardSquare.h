//
//  BoardSquare.h
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Square.h"

@interface BoardSquare : NSObject <Square>

@property (strong, nonatomic) UIButton *button;

- (id)initWithButton:(UIButton *)button;
- (void)setColorBasedOnSymbol:(NSString *)symbol;

@end
