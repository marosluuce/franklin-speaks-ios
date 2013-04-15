//
//  Communicator.h
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Communicator <NSObject>

- (NSDictionary *)communicate:(NSDictionary *)dict;

@end
