/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookMessageCollectionFetcher.h"

/**
* The implementation file for type MSOutlookMessageCollectionFetcher.
*/

@implementation MSOutlookMessageCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookMessage class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookMessage* )entity :(void (^)(MSOutlookMessage *message, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookMessageFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookMessageFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookMessage class]];
}
@end
