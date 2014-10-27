/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryExtensionPropertyCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryExtensionPropertyCollectionFetcher.
*/

@implementation MSDirectoryExtensionPropertyCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryExtensionProperty class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryExtensionProperty* )entity :(void (^)(MSDirectoryExtensionProperty *extensionProperty, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryExtensionPropertyFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryExtensionPropertyFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryExtensionProperty class]];
}
@end
