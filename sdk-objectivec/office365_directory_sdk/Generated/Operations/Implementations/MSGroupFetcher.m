/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSGroupFetcher.h"
#import "MSAppRoleAssignmentCollectionFetcher.h"


/**
* The implementation file for type MSGroupFetcher.
*/


@implementation MSGroupFetcher
-(MSGroupOperations*) getOperations{
	return [[MSGroupOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSGroup class]];
}

-(MSAppRoleAssignmentCollectionFetcher*) getappRoleAssignments{
    return [[MSAppRoleAssignmentCollectionFetcher alloc] initWith:@"appRoleAssignments" :self : [MSAppRoleAssignment class]];
}


@end