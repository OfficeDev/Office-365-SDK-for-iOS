/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookEntityCollectionFetcher.h"

/**
* The implementation file for type MSOutlookEntityCollectionFetcher.
*/

@implementation MSOutlookEntityCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookEntity class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookEntity* )entity :(void (^)(MSOutlookEntity *entity, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookEntityFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookEntityFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookEntity class]];
}
@end
