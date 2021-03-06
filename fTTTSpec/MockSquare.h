//
//  MockSquare.h
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Square.h"

@interface MockSquare : NSObject <Square>

@property (strong, nonatomic) NSString *squareValue;
@property (nonatomic) int squareNumber;

@end
