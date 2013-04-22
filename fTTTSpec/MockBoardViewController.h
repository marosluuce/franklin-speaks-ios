//
//  MockBoardViewController.h
//  fTTT
//
//  Created by Nathan Walker on 4/17/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BoardView.h"
#import "MockSquare.h"

@interface MockBoardViewController : NSObject <BoardView>

@property BOOL gameOverAlertCalled;
@property (strong, nonatomic) NSArray *squares;

- (NSArray *)createSquares;

@end
