//
//  MockCommunicator.h
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Communicator.h"

@interface MockCommunicator : NSObject <Communicator>

@property (strong, nonatomic) NSMutableArray *squares;
@property (strong, nonatomic) NSDictionary *lastRequest;

- (NSString *)flipFlopXO;
- (NSString *)winner;
- (BOOL)full;
- (BOOL)gameover;
- (void)newGame;
- (NSDictionary *)gameState;

@end
