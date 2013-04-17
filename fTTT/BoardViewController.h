//
//  BoardViewController.h
//  fTTT
//
//  Created by Nathan Walker on 4/11/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BoardView.h"
#import "BoardSquare.h"
#import "HttpConnector.h"
#import "ServerCommunicator.h"
#import "Square.h"
#import "TicTacToe.h"

@interface BoardViewController : UIViewController <BoardView>

@property (strong, nonatomic) TicTacToe *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *squares;

- (IBAction)touchSquare:(id)sender;

@end
