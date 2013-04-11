#import <OCDSpec2/OCDSpec2.h>

#import "FranklinAppDelegate.h"

OCDSpec2Context(FranklinAppDelegateSpec) {
  
  Describe(@"-application didFinishLaunchingWithOptions", ^{
    
    It(@"sets a rootViewController", ^{
      FranklinAppDelegate *delegate = [[FranklinAppDelegate alloc] init];
      [delegate application:nil didFinishLaunchingWithOptions:nil];
      
      [ExpectObj(delegate.window.rootViewController) toExist];
    });
    
  });
  
}
