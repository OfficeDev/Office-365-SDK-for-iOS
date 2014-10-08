/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOBasicCredentials.h"

@interface MSOBasicCredentials()

@property NSString* token;

@end

@implementation MSOBasicCredentials

-(void)addToken : (NSString*) token{
    self.token = token;
}

-(void)prepareRequest:(id<MSORequest>)request{
    [request addHeader:@"Authorization" :[[NSString alloc] initWithFormat:@"Basic %@", self.token]];
}
@end
