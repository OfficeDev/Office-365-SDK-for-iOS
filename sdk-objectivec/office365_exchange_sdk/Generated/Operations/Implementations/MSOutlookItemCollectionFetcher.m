/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookItemCollectionFetcher.h"

/**
* The implementation file for type MSOutlookItemCollectionFetcher.
*/

@implementation MSOutlookItemCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookItem class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookItem* )entity :(void (^)(MSOutlookItem *item, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookItemFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookItemFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookItem class]];
}
@end
