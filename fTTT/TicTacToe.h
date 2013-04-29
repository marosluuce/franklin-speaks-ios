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
@property (strong, nonatomic) NSString *currentplayer;
@property BOOL gameover;

- (id)initWithCommunicator:(id <Communicator>)communicator;

- (void)communicate:(NSDictionary *)message;
- (void)updateGame:(NSDictionary *)result;
- (NSString *)squareIs:(int)square;
- (BOOL)isDraw;

@end
