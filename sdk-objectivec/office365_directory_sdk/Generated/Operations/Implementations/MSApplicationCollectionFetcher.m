/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSApplicationCollectionFetcher.h"

/**
* The implementation file for type MSApplicationCollectionFetcher.
*/

@implementation MSApplicationCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSApplication class]];
}

-(NSURLSessionDataTask*)add:(MSApplication* )entity :(void (^)(MSApplication *application, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSApplicationFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSApplicationFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSApplication class]];
}
@end
