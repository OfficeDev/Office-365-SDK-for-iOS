/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFolderCollectionFetcher.h"

@implementation MSOFolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOFolder class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOFolder> *folder, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOFolder* )entity :(void (^)(MSOFolder *folder, NSError *e))callback{
	return nil;
}

-(MSOFolderFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
