/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointFileCollectionFetcher.h"

/**
* The implementation file for type MSSharePointFileCollectionFetcher.
*/

@implementation MSSharePointFileCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSSharePointFile class]];
}

-(NSURLSessionDataTask*)add:(MSSharePointFile* )entity :(void (^)(MSSharePointFile *file, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSSharePointFileFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSharePointFileFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSSharePointFile class]];
}
@end
