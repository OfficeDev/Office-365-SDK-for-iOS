/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDeviceConfigurationCollectionFetcher.h"

/**
* The implementation file for type MSDeviceConfigurationCollectionFetcher.
*/

@implementation MSDeviceConfigurationCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDeviceConfiguration class]];
}

-(NSURLSessionDataTask*)add:(MSDeviceConfiguration* )entity :(void (^)(MSDeviceConfiguration *deviceConfiguration, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDeviceConfigurationFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDeviceConfigurationFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDeviceConfiguration class]];
}
@end
