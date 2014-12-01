/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataBasicCredentials.h"

@interface MSODataBasicCredentials()

@property NSString* token;

@end

@implementation MSODataBasicCredentials

-(void)addToken : (NSString*) token{
    self.token = token;
}

-(void)prepareRequest:(id<MSODataRequest>)request{
    [request addHeader:@"Authorization" :[[NSString alloc] initWithFormat:@"Basic %@", self.token]];
}
@end
