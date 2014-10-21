/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFileCollectionFetcher.h"

/**
* The implementation file for type MSOFileCollectionFetcher.
*/

@implementation MSOFileCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOFile class]];
}

-(NSURLSessionDataTask*)add:(MSOFile* )entity :(void (^)(MSOFile *file, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOFileFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOFileFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOFile class]];
}
@end
