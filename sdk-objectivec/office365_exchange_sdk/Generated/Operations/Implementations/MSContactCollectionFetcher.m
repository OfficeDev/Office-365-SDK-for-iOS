/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSContactCollectionFetcher.h"

/**
* The implementation file for type MSContactCollectionFetcher.
*/

@implementation MSContactCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSContact class]];
}

-(NSURLSessionDataTask*)add:(MSContact* )entity :(void (^)(MSContact *contact, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSContactFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSContactFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSContact class]];
}
@end
