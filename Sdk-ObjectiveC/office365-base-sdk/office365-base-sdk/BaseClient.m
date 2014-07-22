//
//  BaseClient.m
//  office365-base-sdk
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "BaseClient.h"

@implementation BaseClient

- (instancetype)initWithUrl:(NSString *)url credentials:(Credentials *)credentials
{
    self.Credential = credentials;
    self.Url = url;
    return self;
}

- (NSMutableArray *)parseData:(NSData *)data{
    return [NSMutableArray alloc];
}

@end