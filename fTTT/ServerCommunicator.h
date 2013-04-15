//
//  ServerCommunicator.h
//  fTTT
//
//  Created by Nathan Walker on 4/11/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Connector.h"
#import "Communicator.h"

@interface ServerCommunicator : NSObject <Communicator>

@property (strong) NSURL *url;
@property (strong) id <Connector> connector;

- (id)initWithUrl:(NSURL *)url andWithConnector:(id <Connector>)connector;

- (NSString *)dictionaryToQueryString:(NSDictionary *)dict;
- (NSURLRequest *)createRequest:(NSDictionary *)postData;
- (NSData *)sendRequest:(NSURLRequest *)request withConnector:(id <Connector>)connector;
- (NSDictionary *)parseDataToJson:(NSData *)data;

@end
