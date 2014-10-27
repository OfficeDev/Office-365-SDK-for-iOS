/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointDriveCollectionFetcher.h"

/**
* The implementation file for type MSSharePointDriveCollectionFetcher.
*/

@implementation MSSharePointDriveCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSSharePointDrive class]];
}

-(NSURLSessionDataTask*)add:(MSSharePointDrive* )entity :(void (^)(MSSharePointDrive *drive, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSSharePointDriveFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSharePointDriveFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSSharePointDrive class]];
}
@end
