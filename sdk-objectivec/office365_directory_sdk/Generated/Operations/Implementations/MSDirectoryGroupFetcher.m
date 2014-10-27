/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryGroupFetcher.h"
#import "MSDirectoryAppRoleAssignmentCollectionFetcher.h"


/**
* The implementation file for type MSDirectoryGroupFetcher.
*/


@implementation MSDirectoryGroupFetcher
-(MSDirectoryGroupOperations*) getOperations{
	return [[MSDirectoryGroupOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryGroup class]];
}

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments{
    return [[MSDirectoryAppRoleAssignmentCollectionFetcher alloc] initWith:@"appRoleAssignments" :self : [MSDirectoryAppRoleAssignment class]];
}


@end