//
//  ServerCommunicator.m
//  fTTT
//
//  Created by Nathan Walker on 4/11/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "ServerCommunicator.h"

@implementation ServerCommunicator

- (id)initWithUrl:(NSURL *)url andWithConnector:(id<Connector>)connector{
  if (self = [super init]) {
    self.url = url;
    self.connector = connector;
  }
  
  return self;
}

- (NSString *)dictionaryToQueryString:(NSDictionary *)dict {
  NSMutableArray *items = [[NSMutableArray alloc] init];
  
  for (NSString *key in dict) {
    NSString *string = [NSString stringWithFormat:@"%@=%@", key, [dict objectForKey:key]];
    [items addObject:string];
  }
  
  return [items componentsJoinedByString:@"&"];
}

- (NSURLRequest *)createRequest:(NSDictionary *)postData {
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url];
  
  request.HTTPMethod = @"POST";
  request.HTTPBody = [[self dictionaryToQueryString:postData] dataUsingEncoding:NSUTF8StringEncoding];
  
  return request;
}

- (NSData *)sendRequest:(NSURLRequest *)request withConnector:(id<Connector>)connector {
  return [connector send:request];
}

- (NSDictionary *)parseDataToJson:(NSData *)data {
  return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (NSDictionary *)communicate:(NSDictionary *)dict {
  NSURLRequest *request = [self createRequest:dict];
  NSData *data = [self sendRequest:request withConnector:self.connector];
  return [self parseDataToJson:data];
}

@end
