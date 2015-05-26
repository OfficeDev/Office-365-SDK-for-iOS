/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

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