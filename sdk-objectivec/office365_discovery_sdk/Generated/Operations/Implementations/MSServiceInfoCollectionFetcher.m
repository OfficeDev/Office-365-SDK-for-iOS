/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSServiceInfoCollectionFetcher.h"

/**
* The implementation file for type MSServiceInfoCollectionFetcher.
*/

@implementation MSServiceInfoCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSServiceInfo class]];
}

-(NSURLSessionDataTask*)add:(MSServiceInfo* )entity :(void (^)(MSServiceInfo *serviceInfo, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSServiceInfoFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSServiceInfoFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSServiceInfo class]];
}
@end
