#import <OCDSpec2/OCDSpec2.h>
#import "BoardSquare.h"

OCDSpec2Context(BoardSquareSpec) {
  
  Describe(@"Board", ^{
    __block UIButton *button;
    __block BoardSquare *square;
    
    
    BeforeEach(^{
      button = [[UIButton alloc] init];
      square = [[BoardSquare alloc] initWithButton: button];
    });
    
    It(@"sets the button title based on the value", ^{
      [square setValue: @"Title"];
      
      [ExpectStr(button.currentTitle) toStartWith:@"Title"];
    });
    
    It(@"gets returns its value", ^{
      [square setValue:@"Title"];
      
      [ExpectStr(square.value) toStartWith:@"Title"];
    });
    
    It(@"returns its buttons tag as its number", ^{
      button.tag = 12;
      
      [ExpectInt(square.number) toBe:12];
    });
    
    It(@"sets the color for x to X Color based on the squares value", ^{
      [square setValue: @"x"];
      
      [ExpectObj(button.currentTitleColor) toBeEqualTo: square.XColor];
    });
    
    It(@"sets the color for o to O Color based on the squares value", ^{
      [square setValue: @"o"];
      
      [ExpectObj(button.currentTitleColor) toBeEqualTo: square.OColor];
    });
    
    It(@"sets the color to X Color for X as well as x", ^{
      [square setValue:@"X"];
      
      [ExpectObj(button.currentTitleColor) toBeEqualTo:square.XColor];
    });
  });
  
}
