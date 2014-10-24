/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesFileCollectionFetcher.h"

/**
* The implementation file for type MSFilesFileCollectionFetcher.
*/

@implementation MSFilesFileCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSFilesFile class]];
}

-(NSURLSessionDataTask*)add:(MSFilesFile* )entity :(void (^)(MSFilesFile *file, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSFilesFileFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSFilesFileFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSFilesFile class]];
}
@end
