#import <OCDSpec2/OCDSpec2.h>

OCDSpec2Context(InitialSpec) {
  
  Describe(@"-someMethod", ^{
    
    It(@"fails", ^{
      [ExpectBool(NO) toBeTrue];
    });
    
  });
  
}
