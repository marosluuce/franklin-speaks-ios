//
//  MockBoardViewController.h
//  fTTT
//
//  Created by Nathan Walker on 4/17/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BoardView.h"

@interface MockBoardViewController : NSObject <BoardView>

@property BOOL gameOverAlertCalled;

- (void)alertGameOver;

@end
