/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSEntityCollectionFetcher.h"

/**
* The implementation file for type MSEntityCollectionFetcher.
*/

@implementation MSEntityCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSEntity class]];
}

-(NSURLSessionDataTask*)add:(MSEntity* )entity :(void (^)(MSEntity *entity, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSEntityFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSEntityFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSEntity class]];
}
@end
