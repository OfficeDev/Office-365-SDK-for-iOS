/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesItemCollectionFetcher.h"

/**
* The implementation file for type MSFilesItemCollectionFetcher.
*/

@implementation MSFilesItemCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSFilesItem class]];
}

-(NSURLSessionDataTask*)add:(MSFilesItem* )entity :(void (^)(MSFilesItem *item, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSFilesItemFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSFilesItemFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSFilesItem class]];
}
@end
