#import <OCDSpec2/OCDSpec2.h>

#import "MockBoardViewController.h"
#import "MockCommunicator.h"
#import "MockSquare.h"
#import "TicTacToe.h"

OCDSpec2Context(TicTacToeSpec) {
  
  __block TicTacToe *game;
  __block MockCommunicator *communicator;
  __block MockBoardViewController *view;
  
  BeforeEach(^{
    communicator = [[MockCommunicator alloc] init];
    view = [[MockBoardViewController alloc] init];
    game = [[TicTacToe alloc] initWithCommunicator:communicator];
  });
  
  Describe(@"-makeMove", ^{
    
    It(@"makes a move", ^{      
      NSDictionary *result = [game makeMove:1];
      
      [ExpectObj([result objectForKey:@"squares"]) toBeKindOfClass:[NSArray class]];
    });
    
  });
  
  Describe(@"-formatMove", ^{
    
    It(@"formats a move as a dictionary", ^{
      NSDictionary *formattedMove = [game formatMove:1];
      
      [ExpectObj(formattedMove) toBeEqualTo:@{@"square": @"1"}];
    });
    
  });
  
  Describe(@"-moveAndUpdateGame", ^{
    
    It(@"makes a move and updates the squares", ^{
      NSArray *squares = @[@"X", @"", @"", @"", @"", @"", @"", @"", @""];
      [game moveAndUpdateGame:1];
      
      [ExpectObj(game.squares) toBeEqualTo:squares];
    });
    
    It(@"makes a move and updates the winner", ^{
      [game moveAndUpdateGame:1];
      
      [ExpectObj(game.winner) toBeEqualTo:@""];
      
      [game moveAndUpdateGame:4];
      [game moveAndUpdateGame:2];
      [game moveAndUpdateGame:5];
      [game moveAndUpdateGame:3];
      
      NSLog(@"%@", game.squares);
      
      [ExpectObj(game.winner) toBeEqualTo:@"X"];
    });
    
    It(@"only updates if gameover is false", ^{
      game.gameover = NO;
      [game moveAndUpdateGame:1];
      [ExpectObj([game.squares objectAtIndex:0]) toBeEqualTo:@"X"];
      
      game.gameover = YES;
      NSString *value = [game.squares objectAtIndex:1];
      [game moveAndUpdateGame:2];
      [ExpectObj([game.squares objectAtIndex:1]) toBeEqualTo:value];
    });
    
    It(@"only updates the gameover value if the result is different", ^{
      [game moveAndUpdateGame:1];
      
      [ExpectBool(game.gameover) toBeFalse];
      
      [game moveAndUpdateGame:4];
      [game moveAndUpdateGame:2];
      [game moveAndUpdateGame:5];
      [game moveAndUpdateGame:3];
            
      [ExpectBool(game.gameover) toBeTrue];
    });
    
  });
  
  Describe(@"-squareIs", ^{
    
    It(@"is the value of squares at index square - 1", ^{
      [ExpectObj([game squareIs:1]) toBeEqualTo:@""];
      
      game.squares = @[@"x", @"", @"", @"", @"", @"", @"", @"", @""];
      
      [ExpectObj([game squareIs:1]) toBeEqualTo:@"x"];
    });
    
  });
  
  Describe(@"-updateSquare", ^{
    
    __block MockSquare *square;
    
    BeforeEach(^{
      square = [[MockSquare alloc] init];
      [game updateSquare:square];
    });
    
    It(@"makes the move for the square", ^{
      [ExpectObj([game squareIs:square.number]) toBeEqualTo:@"X"];
    });
    
    It(@"updates the square's value", ^{
      [ExpectObj(square.value) toBeEqualTo:[game squareIs:square.number]];
    });
    
  });
  
  Describe(@"-gameOverMessage", ^{
    
    It(@"is 'Draw!' if gameover and winner is ''", ^{
      game.gameover = YES;
      game.winner = @"";
      [ExpectObj([game gameOverMessage]) toBeEqualTo:@"Draw!"];
    });
    
    It(@"is 'X Won!' if gameover and winner is 'X'", ^{
      game.gameover = YES;
      game.winner = @"x";
      [ExpectObj([game gameOverMessage]) toBeEqualTo:@"X Won!"];
    });
    
    It(@"is '' if not gameover", ^{
      game.gameover = NO;
      game.winner = @"";
      [ExpectObj([game gameOverMessage]) toBeEqualTo:@""];
    });
    
  });
  
  Describe(@"-updateView", ^{
    
    It(@"alerts if the game is over", ^{
      game.gameover = NO;
      [game updateView:view];
      
      [ExpectBool(view.gameOverAlertCalled) toBeFalse];
      
      game.gameover = YES;
      [game updateView:view];
      
      [ExpectBool(view.gameOverAlertCalled) toBeTrue];
    });
    
  });
    
}
