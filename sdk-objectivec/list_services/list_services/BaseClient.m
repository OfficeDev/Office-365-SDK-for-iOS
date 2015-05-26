/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

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