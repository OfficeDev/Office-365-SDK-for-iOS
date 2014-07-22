//
//  OAuthentication.m
//  office365-base-sdk
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "OAuthentication.h"

@implementation OAuthentication : Credentials

NSString * token;

- (void)prepareRequest:(NSMutableURLRequest *)request{
    [request addValue:[NSString stringWithFormat: @"Bearer %@", token] forHTTPHeaderField: @"Authorization"];
}

- (void)setToken:(NSString *)token{
    token = token;
}

-(NSString*)getToken{
    return token;
}

@end