/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOItemCollectionFetcher.h"

/**
* The implementation file for type MSOItemCollectionFetcher.
*/

@implementation MSOItemCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOItem class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOItem> *item, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOItem* )entity :(void (^)(MSOItem *item, NSError *e))callback{
	return nil;
}

-(MSOItemFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
