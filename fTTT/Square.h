//
//  Square.h
//  fTTT
//
//  Created by Nathan Walker on 4/15/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Square <NSObject>

- (void)setValue:(NSString *)value;
- (NSString *)value;
- (int)number;

@end
