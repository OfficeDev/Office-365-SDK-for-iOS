/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataOAuthCredentials.h"

@interface MSODataOAuthCredentials()

@property NSString* token;

@end

@implementation MSODataOAuthCredentials

-(void)addToken : (NSString*) token{
    self.token = token;
}

-(void)prepareRequest:(id<MSODataRequest>)request{
    [request addHeader:@"Authorization" :[[NSString alloc] initWithFormat:@"Bearer %@", self.token]];
}

@end