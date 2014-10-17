/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEntityCollectionFetcher.h"

/**
* The implementation file for type MSOEntityCollectionFetcher.
*/

@implementation MSOEntityCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOEntity class]];
}

-(NSURLSessionDataTask*)add:(MSOEntity* )entity :(void (^)(MSOEntity *entity, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOEntityFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOEntityFetcher alloc] initWith:@"" : self :[MSOEntity class]];
}
@end
