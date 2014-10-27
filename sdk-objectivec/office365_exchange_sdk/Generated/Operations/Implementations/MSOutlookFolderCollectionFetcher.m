/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookFolderCollectionFetcher.h"

/**
* The implementation file for type MSOutlookFolderCollectionFetcher.
*/

@implementation MSOutlookFolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookFolder class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookFolder* )entity :(void (^)(MSOutlookFolder *folder, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookFolderFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookFolder class]];
}
@end
