//
//  MockHttpConnector.m
//  fTTT
//
//  Created by Nathan Walker on 4/12/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "MockHttpConnector.h"
#import "ServerCommunicator.h"

@implementation MockHttpConnector

- (NSData *)send:(NSURLRequest *)request {
  NSString *string = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
  
  NSString *result = @"";
    
  if ([string isEqual:@"Baltar=Gaius"]) {
    result = @"{\"Quote\":\"No more Mr. Nice Gaius!\"}";
  }
    
  return [result dataUsingEncoding:NSUTF8StringEncoding];
}

@end
