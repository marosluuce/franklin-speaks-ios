//
//  Connector.h
//  fTTT
//
//  Created by Nathan Walker on 4/12/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Connector

- (NSData *)send:(NSURLRequest *) request;

@end
