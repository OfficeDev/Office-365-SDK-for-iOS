/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSMessageCollectionFetcher.h"

/**
* The implementation file for type MSMessageCollectionFetcher.
*/

@implementation MSMessageCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSMessage class]];
}

-(NSURLSessionDataTask*)add:(MSMessage* )entity :(void (^)(MSMessage *message, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSMessageFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSMessageFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSMessage class]];
}
@end
