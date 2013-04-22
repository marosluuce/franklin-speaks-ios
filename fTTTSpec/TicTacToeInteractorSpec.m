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
  __block MockBoardViewController *view;
  __block MockCommunicator *communicator;
  
  BeforeEach(^{
    communicator = [[MockCommunicator alloc] init];
    game = [[TicTacToe alloc] initWithCommunicator:communicator];
    view = [[MockBoardViewController alloc] init];
    interactor = [[TicTacToeInteractor alloc] initWithGame:game withView:view];
  });
  
  Describe(@"+newInteractorWithGame", ^{
    
    It(@"is a TicTacToeInteractor", ^{
      interactor = [TicTacToeInteractor newInteractorWithGame:view];
      
      [ExpectObj(interactor) toBeKindOfClass:[TicTacToeInteractor class]];
    });
    
  });
  
  Describe(@"-initWithGame", ^{
    
    It(@"sends a newgame command", ^{
      interactor = [[TicTacToeInteractor alloc] initWithGame:game withView:view];
      [ExpectObj(communicator.lastRequest) toBeEqualTo:@{@"newgame": @"true"}];
    });
    
  });
  
  Describe(@"-updateView", ^{
    
    It(@"alerts if the game is over", ^{
      game.gameover = NO;
      [interactor updateView:view];
      
      [ExpectBool(view.gameOverAlertCalled) toBeFalse];
      
      game.gameover = YES;
      [interactor updateView:view];
      
      [ExpectBool(view.gameOverAlertCalled) toBeTrue];
    });
    
    It(@"updates the squares", ^{
      game.squares = @[@"X", @"O", @"X",
                       @"X", @"X", @"",
                       @"O", @"O", @"X",];
      [interactor updateView:view];
      
      for (int i = 0; i < [view.squares count]; i++) {
        MockSquare *square = [view.squares objectAtIndex:i];
        [ExpectObj([square value]) toBeEqualTo:[game.squares objectAtIndex:i]];
      }
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
      [interactor updateSquares:view.squares];
      
      for (int i = 0; i < [view.squares count]; i++) {
        MockSquare *square = [view.squares objectAtIndex:i];
        [ExpectObj([square value]) toBeEqualTo:[game.squares objectAtIndex:i]];
      }
    });
    
  });
  
  Describe(@"-doMove:withView:", ^{
    
    It(@"makes a move", ^{
      [interactor doMove:1 withView:view];
      
      [ExpectObj([game squareIs:1]) toBeEqualTo:@"X"];
    });
    
  });
  
  Describe(@"-newGame", ^{
    
    It(@"sends a newgame message", ^{
      [interactor newGame:view];
      
      [ExpectObj(communicator.lastRequest) toBeEqualTo:@{@"newgame": @"true"}];
    });
    
    It(@"updates to show the blank squares", ^{
      game.squares = @[@"X", @"O", @"X",
                       @"X", @"X", @"",
                       @"O", @"O", @"X",];
      [interactor updateSquares:view.squares];
      [interactor newGame:view];
      
      for (int i = 0; i < [view.squares count]; i++) {
        MockSquare *square = [view.squares objectAtIndex:i];
        [ExpectObj([square value]) toBeEqualTo:@""];
      }
    });
    
  });
  
}
