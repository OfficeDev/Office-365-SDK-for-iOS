/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDeviceConfigurationCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryDeviceConfigurationCollectionFetcher.
*/

@implementation MSDirectoryDeviceConfigurationCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryDeviceConfiguration class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryDeviceConfiguration* )entity :(void (^)(MSDirectoryDeviceConfiguration *deviceConfiguration, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryDeviceConfigurationFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryDeviceConfigurationFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryDeviceConfiguration class]];
}
@end
