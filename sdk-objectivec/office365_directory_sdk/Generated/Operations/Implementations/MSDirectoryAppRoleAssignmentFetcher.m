/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryAppRoleAssignmentFetcher.h"


/**
* The implementation file for type MSDirectoryAppRoleAssignmentFetcher.
*/


@implementation MSDirectoryAppRoleAssignmentFetcher
-(MSDirectoryAppRoleAssignmentOperations*) getOperations{
	return [[MSDirectoryAppRoleAssignmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryAppRoleAssignment class]];
}


@end