/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFolderCollectionFetcher.h"

/**
* The implementation file for type MSFolderCollectionFetcher.
*/

@implementation MSFolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSFolder class]];
}

-(NSURLSessionDataTask*)add:(MSFolder* )entity :(void (^)(MSFolder *folder, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSFolderFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSFolder class]];
}
@end
