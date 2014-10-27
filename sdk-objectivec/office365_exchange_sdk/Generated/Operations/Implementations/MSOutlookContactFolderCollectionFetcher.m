/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookContactFolderCollectionFetcher.h"

/**
* The implementation file for type MSOutlookContactFolderCollectionFetcher.
*/

@implementation MSOutlookContactFolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookContactFolder class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookContactFolder* )entity :(void (^)(MSOutlookContactFolder *contactFolder, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookContactFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookContactFolderFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookContactFolder class]];
}
@end
