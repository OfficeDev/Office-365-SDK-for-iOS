/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDeviceCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryDeviceCollectionFetcher.
*/

@implementation MSDirectoryDeviceCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryDevice class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryDevice* )entity :(void (^)(MSDirectoryDevice *device, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryDeviceFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryDeviceFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryDevice class]];
}
@end
