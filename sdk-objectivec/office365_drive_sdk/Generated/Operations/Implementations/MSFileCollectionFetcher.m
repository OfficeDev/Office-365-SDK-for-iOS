/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFileCollectionFetcher.h"

/**
* The implementation file for type MSFileCollectionFetcher.
*/

@implementation MSFileCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSFile class]];
}

-(NSURLSessionDataTask*)add:(MSFile* )entity :(void (^)(MSFile *file, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSFileFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSFileFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSFile class]];
}
@end
