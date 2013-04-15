//
//  MockHttpConnector.h
//  fTTT
//
//  Created by Nathan Walker on 4/12/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Connector.h"

@interface MockHttpConnector : NSObject <Connector>

- (NSData *)send:(NSURLRequest *)request;

@end
