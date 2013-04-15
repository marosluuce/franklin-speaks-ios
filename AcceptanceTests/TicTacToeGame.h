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
#import "TicTacToe.h"

@interface TicTacToeGame : NSObject

@property (strong) TicTacToe *game;

- (void) launch;
- (void) moveToSquare:(NSString *)square;
- (NSString*) squareIs:(NSString *)square;

@end
