/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryRoleCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryRoleCollectionFetcher.
*/

@implementation MSDirectoryRoleCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryRole class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryRole* )entity :(void (^)(MSDirectoryRole *directoryRole, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryRoleFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryRoleFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryRole class]];
}
@end
