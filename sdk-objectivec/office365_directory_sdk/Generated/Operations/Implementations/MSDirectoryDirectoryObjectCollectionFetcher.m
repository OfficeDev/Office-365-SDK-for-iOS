/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryObjectCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryDirectoryObjectCollectionFetcher.
*/

@implementation MSDirectoryDirectoryObjectCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryDirectoryObject class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryDirectoryObject* )entity :(void (^)(MSDirectoryDirectoryObject *directoryObject, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryDirectoryObjectFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryDirectoryObjectFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryDirectoryObject class]];
}
@end
