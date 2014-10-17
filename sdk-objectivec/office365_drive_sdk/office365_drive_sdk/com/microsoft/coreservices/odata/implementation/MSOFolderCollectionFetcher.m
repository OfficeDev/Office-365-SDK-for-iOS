/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFolderCollectionFetcher.h"

/**
* The implementation file for type MSOFolderCollectionFetcher.
*/

@implementation MSOFolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOFolder class]];
}

-(NSURLSessionDataTask*)add:(MSOFolder* )entity :(void (^)(MSOFolder *folder, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOFolderFetcher alloc] initWith:@"" : self :[MSOFolder class]];
}
@end
