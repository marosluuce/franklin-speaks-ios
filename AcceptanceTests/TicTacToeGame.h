//
//  TicTacToeGame.h
//  fTTT
//
//  Created by Nathan Walker on 4/10/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Communicator.h"
#import "Connector.h"
#import "MockCommunicator.h"
#import "MockBoardViewController.h"
#import "TicTacToe.h"
#import "TicTacToeInteractor.h"

@interface TicTacToeGame : NSObject

@property (strong, nonatomic) TicTacToe *game;
@property (strong, nonatomic) TicTacToeInteractor *interactor;
@property (strong, nonatomic) MockBoardViewController *view;

- (void)launch;
- (void)moveToSquare:(NSString *)square;
- (NSString *)squareIs:(NSString *)square;
- (NSString *)winnerIs;
- (BOOL)gameIsDraw;
- (BOOL)gameOverAlertShows;
- (void)tapNewGame;

@end
