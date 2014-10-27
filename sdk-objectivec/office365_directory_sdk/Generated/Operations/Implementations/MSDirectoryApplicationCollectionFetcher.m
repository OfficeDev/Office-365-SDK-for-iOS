/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryApplicationCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryApplicationCollectionFetcher.
*/

@implementation MSDirectoryApplicationCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryApplication class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryApplication* )entity :(void (^)(MSDirectoryApplication *application, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryApplicationFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryApplicationFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryApplication class]];
}
@end
