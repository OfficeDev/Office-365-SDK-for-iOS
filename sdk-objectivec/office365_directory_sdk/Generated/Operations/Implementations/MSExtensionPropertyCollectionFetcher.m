/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSExtensionPropertyCollectionFetcher.h"

/**
* The implementation file for type MSExtensionPropertyCollectionFetcher.
*/

@implementation MSExtensionPropertyCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSExtensionProperty class]];
}

-(NSURLSessionDataTask*)add:(MSExtensionProperty* )entity :(void (^)(MSExtensionProperty *extensionProperty, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSExtensionPropertyFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSExtensionPropertyFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSExtensionProperty class]];
}
@end
