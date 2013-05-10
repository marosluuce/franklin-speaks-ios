//
//  TicTacToeInteractor.h
//  fTTT
//
//  Created by Nathan Walker on 4/18/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Board.h"
#import "HttpConnector.h"
#import "ServerCommunicator.h"
#import "Square.h"
#import "TicTacToe.h"

@interface TicTacToeInteractor : NSObject

@property (strong, nonatomic) TicTacToe *game;
@property (strong, nonatomic) id<Board> board;

+ (id)newInteractorWithGame:(id<Board>)board;
- (id)initWithGame:(TicTacToe *)game withBoard:(id <Board>)board;
- (void)updateView;
- (NSString *)gameOverMessage;
- (void)updateSquares:(NSArray *)squares;
- (void)doMove:(int)square;
- (void)newGame:(NSString *) opponent;

@end
