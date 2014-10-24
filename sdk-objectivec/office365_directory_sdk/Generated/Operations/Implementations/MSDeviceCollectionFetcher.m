/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDeviceCollectionFetcher.h"

/**
* The implementation file for type MSDeviceCollectionFetcher.
*/

@implementation MSDeviceCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDevice class]];
}

-(NSURLSessionDataTask*)add:(MSDevice* )entity :(void (^)(MSDevice *device, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDeviceFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDeviceFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDevice class]];
}
@end
