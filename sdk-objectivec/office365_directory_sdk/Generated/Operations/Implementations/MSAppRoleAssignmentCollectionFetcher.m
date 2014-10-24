/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSAppRoleAssignmentCollectionFetcher.h"

/**
* The implementation file for type MSAppRoleAssignmentCollectionFetcher.
*/

@implementation MSAppRoleAssignmentCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSAppRoleAssignment class]];
}

-(NSURLSessionDataTask*)add:(MSAppRoleAssignment* )entity :(void (^)(MSAppRoleAssignment *appRoleAssignment, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSAppRoleAssignmentFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSAppRoleAssignmentFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSAppRoleAssignment class]];
}
@end
