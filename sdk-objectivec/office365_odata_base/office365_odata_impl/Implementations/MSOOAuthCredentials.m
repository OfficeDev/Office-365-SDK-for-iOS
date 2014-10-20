//
//  MSOOAuthCredentials.m
//  office365_odata_impl
//
//  Created by Gustavo on 10/15/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "MSOOAuthCredentials.h"

@interface MSOOAuthCredentials()

@property NSString* token;

@end

@implementation MSOOAuthCredentials

-(void)addToken : (NSString*) token{
    self.token = token;
}

-(void)prepareRequest:(id<MSORequest>)request{
    [request addHeader:@"Authorization" :[[NSString alloc] initWithFormat:@"Bearer %@", self.token]];
}

@end