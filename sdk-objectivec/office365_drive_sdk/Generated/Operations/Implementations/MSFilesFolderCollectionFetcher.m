/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesFolderCollectionFetcher.h"

/**
* The implementation file for type MSFilesFolderCollectionFetcher.
*/

@implementation MSFilesFolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSFilesFolder class]];
}

-(NSURLSessionDataTask*)add:(MSFilesFolder* )entity :(void (^)(MSFilesFolder *folder, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSFilesFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSFilesFolderFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSFilesFolder class]];
}
@end
