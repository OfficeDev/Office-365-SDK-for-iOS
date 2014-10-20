/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEventCollectionFetcher.h"

/**
* The implementation file for type MSOEventCollectionFetcher.
*/

@implementation MSOEventCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOEvent class]];
}

-(NSURLSessionDataTask*)add:(MSOEvent* )entity :(void (^)(MSOEvent *event, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOEventFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOEventFetcher alloc] initWith:@"" : self :[MSOEvent class]];
}
@end
