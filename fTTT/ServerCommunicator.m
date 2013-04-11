//
//  ServerCommunicator.m
//  fTTT
//
//  Created by Nathan Walker on 4/11/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "ServerCommunicator.h"

@implementation ServerCommunicator

- (id)initWithUrl:(NSURL *)url {
  if (self = [super init]) {
    self.url = url;
  }
  
  return self;
}

+ (NSString *)dictionaryToQueryString:(NSDictionary *)dict {
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
  request.HTTPBody = [[ServerCommunicator dictionaryToQueryString:postData] dataUsingEncoding:NSUTF8StringEncoding];
  
  return request;
}

@end
