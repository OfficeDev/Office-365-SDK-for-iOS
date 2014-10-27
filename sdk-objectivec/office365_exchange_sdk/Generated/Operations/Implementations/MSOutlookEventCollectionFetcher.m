/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookEventCollectionFetcher.h"

/**
* The implementation file for type MSOutlookEventCollectionFetcher.
*/

@implementation MSOutlookEventCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookEvent class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookEvent* )entity :(void (^)(MSOutlookEvent *event, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookEventFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookEventFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookEvent class]];
}
@end
