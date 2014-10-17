/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODriveCollectionFetcher.h"

/**
* The implementation file for type MSODriveCollectionFetcher.
*/

@implementation MSODriveCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSODrive class]];
}

-(NSURLSessionDataTask*)add:(MSODrive* )entity :(void (^)(MSODrive *drive, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSODriveFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSODriveFetcher alloc] initWith:@"" : self :[MSODrive class]];
}
@end
