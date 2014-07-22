//
//  OAuthentication.h
//  office365-base-sdk
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "Credentials.h"

@interface OAuthentication : Credentials

- (void)prepareRequest:(NSMutableURLRequest *)request;
- (void)setToken:(NSString *)token;
-(NSString*)getToken;

@end
