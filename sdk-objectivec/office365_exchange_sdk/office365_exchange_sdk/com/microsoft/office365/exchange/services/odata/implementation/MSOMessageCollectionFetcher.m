/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOMessageCollectionFetcher.h"

@implementation MSOMessageCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOMessage class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOMessage> *message, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOMessage* )entity :(void (^)(MSOMessage *message, NSError *e))callback{
	return nil;
}

-(MSOMessageFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
