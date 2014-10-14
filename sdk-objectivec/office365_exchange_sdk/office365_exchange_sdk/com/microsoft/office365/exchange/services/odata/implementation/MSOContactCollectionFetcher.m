/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContactCollectionFetcher.h"

@implementation MSOContactCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOContact class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOContact> *contact, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOContact* )entity :(void (^)(MSOContact *contact, NSError *e))callback{
	return nil;
}

-(MSOContactFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
