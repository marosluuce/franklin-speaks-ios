#import <OCDSpec2/OCDSpec2.h>

#import "Communicator.h"
#import "MockBoardViewController.h"
#import "MockCommunicator.h"
#import "MockSquare.h"
#import "TicTacToe.h"
#import "TicTacToeInteractor.h"

OCDSpec2Context(TicTacToeInteractorSpec) {
  
  __block TicTacToeInteractor *interactor;
  __block TicTacToe *game;
  __block MockBoardViewController *board;
  __block MockCommunicator *communicator;
  
  BeforeEach(^{
    communicator = [MockCommunicator new];
    game = [[TicTacToe alloc] initWithCommunicator:communicator];
    board = [MockBoardViewController new];
    interactor = [[TicTacToeInteractor alloc] initWithGame:game withBoard:board];
  });
  
  Describe(@"-initWithGame", ^{
    
//    It(@"sends a newgame command", ^{
//      interactor = [[TicTacToeInteractor alloc] initWithGame:game withBoard:board];
//      [ExpectObj(communicator.lastRequest) toBeEqualTo:@{@"newgame": @"true"}];
//    });
    
  });
  
  Describe(@"-updateView", ^{
    
    It(@"alerts if the game is over", ^{
      game.gameover = NO;
      [interactor updateView];
      
      [ExpectBool(board.gameOverAlertCalled) toBeFalse];
      
      game.gameover = YES;
      [interactor updateView];
      
      [ExpectBool(board.gameOverAlertCalled) toBeTrue];
    });
    
    It(@"updates the squares", ^{
      game.squares = @[@"X", @"O", @"X",
                       @"X", @"X", @"",
                       @"O", @"O", @"X",];
      [interactor updateView];
      
      for (int i = 0; i < [board.squares count]; i++) {
        MockSquare *square = [board.squares objectAtIndex:i];
        [ExpectObj([square value]) toBeEqualTo:[game.squares objectAtIndex:i]];
      }
    });
    
    It(@"updates the current player", ^{
      game.currentplayer = @"Player X";
      [interactor updateView];
      
      [ExpectObj(board.currentPlayerString) toBeEqualTo:@"Player X"];
    });
    
  });
  
  Describe(@"-gameOverMessage", ^{
    
    It(@"is 'Draw!' if gameover and winner is ''", ^{
      game.gameover = YES;
      game.winner = @"";
      [ExpectObj([interactor gameOverMessage]) toBeEqualTo:@"Draw!"];
    });
    
    It(@"is 'X Won!' if gameover and winner is 'X'", ^{
      game.gameover = YES;
      game.winner = @"x";
      [ExpectObj([interactor gameOverMessage]) toBeEqualTo:@"X Won!"];
    });
    
    It(@"is '' if not gameover", ^{
      game.gameover = NO;
      game.winner = @"";
      [ExpectObj([interactor gameOverMessage]) toBeEqualTo:@""];
    });
    
  });
  
  Describe(@"-updateSquares", ^{
    
    It(@"updates the value of all of the squares", ^{
      game.squares = @[@"X", @"O", @"X",
                       @"X", @"X", @"",
                       @"O", @"O", @"X",];
      [interactor updateSquares:board.squares];
      
      for (int i = 0; i < [board.squares count]; i++) {
        MockSquare *square = [board.squares objectAtIndex:i];
        [ExpectObj([square value]) toBeEqualTo:[game.squares objectAtIndex:i]];
      }
    });
    
  });
  
  Describe(@"-doMove:withView:", ^{
    
    It(@"makes a move", ^{
      [interactor doMove:1];
      
      [ExpectObj([game squareIs:1]) toBeEqualTo:@"X"];
    });
    
  });
  
  Describe(@"-newGame", ^{
    
    It(@"sends a newgame message", ^{
      [interactor newGame:@"easy_ai"];
      
      [ExpectObj(communicator.lastRequest) toBeEqualTo:@{@"newgame": @"easy_ai"}];
    });
    
    It(@"updates to show the blank squares", ^{
      game.squares = @[@"X", @"O", @"X",
                       @"X", @"X", @"",
                       @"O", @"O", @"X",];
      [interactor updateSquares:board.squares];
      [interactor newGame:@"easy_ai"];
      
      for (int i = 0; i < [board.squares count]; i++) {
        MockSquare *square = [board.squares objectAtIndex:i];
        [ExpectObj([square value]) toBeEqualTo:@""];
      }
    });
    
  });
}
