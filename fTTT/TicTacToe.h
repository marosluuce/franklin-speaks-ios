//
//  TicTacToe.h
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BoardView.h"
#import "Communicator.h"
#import "Square.h"

@interface TicTacToe : NSObject

@property (strong, nonatomic) id <Communicator> communicator;
@property (strong, nonatomic) NSArray *squares;
@property (strong, nonatomic) NSString *winner;
@property BOOL gameover;

- (id)initWithCommunicator:(id <Communicator>)communicator;

- (NSDictionary *)makeMove:(int)square;
- (NSDictionary *)formatMove:(int)square;
- (void)moveAndUpdateGame:(int)square;
- (NSString *)squareIs:(int)square;
- (void)updateSquare:(id <Square>)square;
- (NSString *)gameOverMessage;
- (void)updateView:(id <BoardView>)view;

@end
