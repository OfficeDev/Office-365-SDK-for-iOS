/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesDriveCollectionFetcher.h"

/**
* The implementation file for type MSFilesDriveCollectionFetcher.
*/

@implementation MSFilesDriveCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSFilesDrive class]];
}

-(NSURLSessionDataTask*)add:(MSFilesDrive* )entity :(void (^)(MSFilesDrive *drive, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSFilesDriveFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSFilesDriveFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSFilesDrive class]];
}
@end
