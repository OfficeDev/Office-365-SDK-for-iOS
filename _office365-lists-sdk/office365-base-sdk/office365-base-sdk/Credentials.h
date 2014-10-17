//
//  Credentials.h
//  office365-base-sdk
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Credentials : NSObject

- (void)prepareRequest:(NSMutableURLRequest *)request;

@end
