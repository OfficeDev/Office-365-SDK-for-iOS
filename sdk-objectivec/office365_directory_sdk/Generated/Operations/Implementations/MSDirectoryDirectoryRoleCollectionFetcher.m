/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryRoleCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryDirectoryRoleCollectionFetcher.
*/

@implementation MSDirectoryDirectoryRoleCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryDirectoryRole class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryDirectoryRole* )entity :(void (^)(MSDirectoryDirectoryRole *directoryRole, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryDirectoryRoleFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryDirectoryRoleFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryDirectoryRole class]];
}
@end
