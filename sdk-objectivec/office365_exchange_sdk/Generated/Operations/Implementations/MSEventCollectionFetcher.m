/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSEventCollectionFetcher.h"

/**
* The implementation file for type MSEventCollectionFetcher.
*/

@implementation MSEventCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSEvent class]];
}

-(NSURLSessionDataTask*)add:(MSEvent* )entity :(void (^)(MSEvent *event, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSEventFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSEventFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSEvent class]];
}
@end
