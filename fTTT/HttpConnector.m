//
//  HttpConnector.m
//  fTTT
//
//  Created by Nathan Walker on 4/12/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "HttpConnector.h"

@implementation HttpConnector

- (NSData *)send:(NSURLRequest *)request {
  return [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
}

@end
