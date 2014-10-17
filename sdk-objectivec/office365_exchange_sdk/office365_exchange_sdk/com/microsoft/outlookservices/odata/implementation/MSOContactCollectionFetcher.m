/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContactCollectionFetcher.h"

/**
* The implementation file for type MSOContactCollectionFetcher.
*/

@implementation MSOContactCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOContact class]];
}

-(NSURLSessionDataTask*)add:(MSOContact* )entity :(void (^)(MSOContact *contact, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOContactFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOContactFetcher alloc] initWith:@"" : self :[MSOContact class]];
}
@end
