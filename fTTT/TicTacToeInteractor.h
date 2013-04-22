//
//  TicTacToeInteractor.h
//  fTTT
//
//  Created by Nathan Walker on 4/18/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BoardView.h"
#import "HttpConnector.h"
#import "ServerCommunicator.h"
#import "Square.h"
#import "TicTacToe.h"

@interface TicTacToeInteractor : NSObject

@property (strong, nonatomic) TicTacToe *game;

+ (id)newInteractorWithGame:(id <BoardView>)view;
- (id)initWithGame:(TicTacToe *)game withView:(id <BoardView>)view;
- (void)updateView:(id <BoardView>)view;
- (NSString *)gameOverMessage;
- (void)updateSquares:(NSArray *)squares;
- (void)doMove:(int)square withView:(id <BoardView>)view;
- (void)newGame:(id <BoardView>)view;

@end
