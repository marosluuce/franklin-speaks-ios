//
//  MockBoardViewController.h
//  fTTT
//
//  Created by Nathan Walker on 4/17/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Board.h"
#import "MockSquare.h"

@interface MockBoardViewController : NSObject <Board>

@property BOOL gameOverAlertCalled;
@property (strong, nonatomic) NSArray *squares;
@property (strong, nonatomic) NSString *currentPlayerString;

- (NSArray *)createSquares;

@end
