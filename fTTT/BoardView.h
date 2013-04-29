//
//  BoardView.h
//  fTTT
//
//  Created by Nathan Walker on 4/17/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BoardView <NSObject>

@property (strong, nonatomic) NSArray *squares;

- (void)alertGameOver;
- (void)setCurrentPlayer:(NSString *)currentPlayer;

@end
