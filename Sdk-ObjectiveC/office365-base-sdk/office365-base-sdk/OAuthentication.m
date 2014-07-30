//
//  OAuthentication.m
//  office365-base-sdk
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "OAuthentication.h"

@implementation OAuthentication : Credentials

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