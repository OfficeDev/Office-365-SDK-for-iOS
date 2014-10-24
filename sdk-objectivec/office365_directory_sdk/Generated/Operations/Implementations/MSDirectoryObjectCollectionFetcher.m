/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryObjectCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryObjectCollectionFetcher.
*/

@implementation MSDirectoryObjectCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryObject class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryObject* )entity :(void (^)(MSDirectoryObject *directoryObject, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryObjectFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryObjectFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryObject class]];
}
@end
