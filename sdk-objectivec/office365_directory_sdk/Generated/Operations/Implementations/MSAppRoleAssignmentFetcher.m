/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSAppRoleAssignmentFetcher.h"


/**
* The implementation file for type MSAppRoleAssignmentFetcher.
*/


@implementation MSAppRoleAssignmentFetcher
-(MSAppRoleAssignmentOperations*) getOperations{
	return [[MSAppRoleAssignmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSAppRoleAssignment class]];
}


@end