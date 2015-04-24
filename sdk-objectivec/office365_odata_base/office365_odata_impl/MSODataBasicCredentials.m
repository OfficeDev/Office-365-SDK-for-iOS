/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataBasicCredentials.h"
#import "MSODataRequest.h"

@implementation MSODataBasicCredentials

@synthesize token = _token;

- (void)prepareRequest:(id<MSODataRequest>)request {
    
    [request addHeaderWithName:@"Authorization" value:[NSString stringWithFormat:@"Basic %@", self.token]];
}

@end