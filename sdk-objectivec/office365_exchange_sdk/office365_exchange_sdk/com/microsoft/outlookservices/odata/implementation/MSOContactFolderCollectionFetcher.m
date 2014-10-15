/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContactFolderCollectionFetcher.h"

/**
* The implementation file for type MSOContactFolderCollectionFetcher.
*/

@implementation MSOContactFolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOContactFolder class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOContactFolder> *contactFolder, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOContactFolder* )entity :(void (^)(MSOContactFolder *contactFolder, NSError *e))callback{
	return nil;
}

-(MSOContactFolderFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
