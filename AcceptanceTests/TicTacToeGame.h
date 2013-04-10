//
//  TicTacToeGame.h
//  fTTT
//
//  Created by Nathan Walker on 4/10/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicTacToeGame : NSObject

- (void) launch;
- (void) moveToSquare:(int)square;
- (NSString*) squareIs:(int)square;

@end
