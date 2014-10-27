/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointFolderCollectionFetcher.h"

/**
* The implementation file for type MSSharePointFolderCollectionFetcher.
*/

@implementation MSSharePointFolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSSharePointFolder class]];
}

-(NSURLSessionDataTask*)add:(MSSharePointFolder* )entity :(void (^)(MSSharePointFolder *folder, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSSharePointFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSharePointFolderFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSSharePointFolder class]];
}
@end
