//
//  ServerCommunicator.h
//  fTTT
//
//  Created by Nathan Walker on 4/11/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerCommunicator : NSObject

@property (strong) NSURL *url;

- (id)initWithUrl:(NSURL *)url;

+ (NSString *)dictionaryToQueryString:(NSDictionary *)dict;
- (NSURLRequest *)createRequest:(NSDictionary *)postData;

@end
