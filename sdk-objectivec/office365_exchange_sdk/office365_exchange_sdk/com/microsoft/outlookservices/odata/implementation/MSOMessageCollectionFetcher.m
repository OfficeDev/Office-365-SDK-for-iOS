/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOMessageCollectionFetcher.h"

/**
* The implementation file for type MSOMessageCollectionFetcher.
*/

@implementation MSOMessageCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOMessage class]];
}

-(NSURLSessionDataTask*)add:(MSOMessage* )entity :(void (^)(MSOMessage *message, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOMessageFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOMessageFetcher alloc] initWith:@"" : self :[MSOMessage class]];
}
@end
