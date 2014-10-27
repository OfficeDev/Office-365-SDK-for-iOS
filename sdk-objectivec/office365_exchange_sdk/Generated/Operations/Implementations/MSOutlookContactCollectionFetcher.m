/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookContactCollectionFetcher.h"

/**
* The implementation file for type MSOutlookContactCollectionFetcher.
*/

@implementation MSOutlookContactCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookContact class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookContact* )entity :(void (^)(MSOutlookContact *contact, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookContactFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookContactFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookContact class]];
}
@end
