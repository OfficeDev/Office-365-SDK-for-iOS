
//
//  BaseClient.m
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "BaseClient.h"

@implementation BaseClient

- (id)initWithUrl:(NSString *)url credentials:(Credentials *)credentials
{
    self.Credential = credentials;
    self.Url = url;
    return self;
}

- (NSMutableArray *)parseData:(NSData *)data{
    return [NSMutableArray alloc];
}

@end