#import <OCDSpec2/OCDSpec2.h>

#import "Communicator.h"
#import "Connector.h"
#import "MockCommunicator.h"
#import "MockSquare.h"
#import "TicTacToe.h"

OCDSpec2Context(TicTacToeSpec) {
  
  __block TicTacToe *game;
  __block MockCommunicator *communicator;
  
  BeforeEach(^{
    communicator = [[MockCommunicator alloc] init];
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
  
  Describe(@"-updateWithMove", ^{
    
    It(@"makes a move and updates the squares", ^{
      NSArray *squares = @[@"X", @"", @"", @"", @"", @"", @"", @"", @""];
      [game updateWithMove:1];
      
      [ExpectObj(game.squares) toBeEqualTo:squares];
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
  
}
