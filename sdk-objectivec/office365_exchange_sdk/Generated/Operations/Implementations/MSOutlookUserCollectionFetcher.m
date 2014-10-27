/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookUserCollectionFetcher.h"

/**
* The implementation file for type MSOutlookUserCollectionFetcher.
*/

@implementation MSOutlookUserCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookUser class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookUser* )entity :(void (^)(MSOutlookUser *user, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookUserFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookUserFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookUser class]];
}
@end
