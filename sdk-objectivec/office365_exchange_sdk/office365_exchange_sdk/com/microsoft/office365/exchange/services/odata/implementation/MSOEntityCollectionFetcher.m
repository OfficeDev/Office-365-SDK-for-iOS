/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEntityCollectionFetcher.h"

@implementation MSOEntityCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOEntity class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOEntity> *entity, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOEntity* )entity :(void (^)(MSOEntity *entity, NSError *e))callback{
	return nil;
}

-(MSOEntityFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
