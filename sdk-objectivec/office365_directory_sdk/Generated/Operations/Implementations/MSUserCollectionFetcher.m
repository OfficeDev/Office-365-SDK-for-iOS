/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSUserCollectionFetcher.h"

/**
* The implementation file for type MSUserCollectionFetcher.
*/

@implementation MSUserCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSUser class]];
}

-(NSURLSessionDataTask*)add:(MSUser* )entity :(void (^)(MSUser *user, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSUserFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSUserFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSUser class]];
}
@end
