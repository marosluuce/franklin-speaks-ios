#import <OCDSpec2/OCDSpec2.h>

#import "FranklinAppDelegate.h"
#import "BoardViewController.h"

OCDSpec2Context(FranklinAppDelegateSpec) {
  
  __block FranklinAppDelegate *delegate;
  
  Describe(@"-initWithController", ^{
    
    It(@"sets the controller to a variable", ^{
      UIViewController *test = [UIViewController new];
      delegate = [[FranklinAppDelegate alloc] initWithController:test];
      
      [ExpectObj(delegate.controller) toBeEqualTo:test];
    });
    
  });
  
  Describe(@"-application didFinishLaunchingWithOptions", ^{
    
    It(@"sets a rootViewController", ^{
      delegate = [[FranklinAppDelegate alloc] initWithController:[UIViewController new]];
      [delegate application:nil didFinishLaunchingWithOptions:nil];
      
      [ExpectObj(delegate.window.rootViewController) toExist];
    });
    
  });
  
}
