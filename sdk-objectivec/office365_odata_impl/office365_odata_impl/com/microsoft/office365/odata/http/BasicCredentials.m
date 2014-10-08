//
//  BasicCredentials.m
//  office365_odata_impl
//
//  Created by Gustavo on 10/7/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "BasicCredentials.h"

@interface BasicCredentials()

@property NSString* token;

@end

@implementation BasicCredentials

-(void)addToken : (NSString*) token{
    self.token = token;
}

-(void)prepareRequest:(Request *)request{
    [request addHeader:@"Authorization" :[[NSString alloc] initWithFormat:@"Basic %@", self.token]];
}
@end
