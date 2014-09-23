
//
//  OAuthCredentials.m
//  office365-base-sdk
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "OAuthCredentials.h"

@implementation OAuthCredentials : Credentials

-(id)initWith : (NSString *)token{
    self.token = token;
    return self;
};

- (void)prepareRequest:(NSMutableURLRequest *)request{
    [request addValue:[NSString stringWithFormat: @"Bearer %@", self.token] forHTTPHeaderField: @"Authorization"];
}

-(NSString *)getToken{
    return self.token;
}

@end