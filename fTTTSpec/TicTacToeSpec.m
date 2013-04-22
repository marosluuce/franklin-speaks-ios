#import <OCDSpec2/OCDSpec2.h>

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
  
  Describe(@"-communicate", ^{
    
    It(@"communicates an array", ^{
      NSDictionary *dict = @{@"square": @"1"};
      [game communicate:dict];
      
      [ExpectObj(communicator.lastRequest) toBeEqualTo:dict];
    });
    
    It(@"updates the game", ^{
      NSDictionary *dict = @{@"square": @"1"};
      [game communicate:dict];
      
      [ExpectObj([game squareIs:1]) toBeEqualTo:@"X"];
    });
    
  });
  
  Describe(@"-squareIs", ^{
    
    It(@"is the value of squares at index square - 1", ^{
      [ExpectObj([game squareIs:1]) toBeEqualTo:@""];
      
      game.squares = @[@"x", @"", @"", @"", @"", @"", @"", @"", @""];
      
      [ExpectObj([game squareIs:1]) toBeEqualTo:@"x"];
    });
    
  });
  
  Describe(@"-isDraw", ^{
    
    It(@"is true if gameover and no winner", ^{
      game.gameover = YES;
      game.winner = @"";
      
      [ExpectBool([game isDraw]) toBeTrue];
    });
    
    It(@"is false if gameover and there is a winner", ^{
      game.gameover = YES;
      game.winner = @"X";
      
      [ExpectBool([game isDraw]) toBeFalse];
    });
    
    It(@"is false if not gameover", ^{
      game.gameover = NO;

      [ExpectBool([game isDraw]) toBeFalse];
    });
    
  });
  
  Describe(@"-updateGame", ^{
    
    It(@"updates the game state variables", ^{
      NSDictionary *result = @{@"squares": @[],
                               @"winner": @"junk",
                               @"gameover": @1};
      [game updateGame:result];
      for (NSString *key in result) {
        [ExpectObj([game valueForKey:key]) toBeEqualTo:[result objectForKey:key]];
      }
    });
    
  });
    
}
