/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDriveCollectionFetcher.h"

/**
* The implementation file for type MSDriveCollectionFetcher.
*/

@implementation MSDriveCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDrive class]];
}

-(NSURLSessionDataTask*)add:(MSDrive* )entity :(void (^)(MSDrive *drive, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDriveFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDriveFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDrive class]];
}
@end
