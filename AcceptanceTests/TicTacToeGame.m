//
//  TicTacToeGame.m
//  fTTT
//
//  Created by Nathan Walker on 4/10/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "TicTacToeGame.h"

@implementation TicTacToeGame

- (void) launch {
  id <Communicator> communicator = [[MockCommunicator alloc] init];
  self.game = [[TicTacToe alloc] initWithCommunicator:communicator];
}

- (void) moveToSquare:(NSString *)square {
  [self.game updateWithMove:[square intValue]];
}

- (NSString*) squareIs:(NSString *)square {
  return [self.game squareIs:[square intValue]];
}

@end
