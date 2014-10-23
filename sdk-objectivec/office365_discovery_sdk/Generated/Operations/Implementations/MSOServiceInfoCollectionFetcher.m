/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOServiceInfoCollectionFetcher.h"

/**
* The implementation file for type MSOServiceInfoCollectionFetcher.
*/

@implementation MSOServiceInfoCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOServiceInfo class]];
}

-(NSURLSessionDataTask*)add:(MSOServiceInfo* )entity :(void (^)(MSOServiceInfo *serviceInfo, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOServiceInfoFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOServiceInfoFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOServiceInfo class]];
}
@end
