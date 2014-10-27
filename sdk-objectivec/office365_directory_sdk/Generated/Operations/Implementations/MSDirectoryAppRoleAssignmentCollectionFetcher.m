/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryAppRoleAssignmentCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryAppRoleAssignmentCollectionFetcher.
*/

@implementation MSDirectoryAppRoleAssignmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryAppRoleAssignment class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryAppRoleAssignment* )entity :(void (^)(MSDirectoryAppRoleAssignment *appRoleAssignment, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryAppRoleAssignmentFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryAppRoleAssignmentFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryAppRoleAssignment class]];
}
@end
