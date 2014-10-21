/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCurrentUserRequestContextCollectionFetcher.h"

/**
* The implementation file for type MSOCurrentUserRequestContextCollectionFetcher.
*/

@implementation MSOCurrentUserRequestContextCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOCurrentUserRequestContext class]];
}

-(NSURLSessionDataTask*)add:(MSOCurrentUserRequestContext* )entity :(void (^)(MSOCurrentUserRequestContext *currentUserRequestContext, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOCurrentUserRequestContextFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOCurrentUserRequestContextFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOCurrentUserRequestContext class]];
}
@end
