/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryRoleFetcher.h"


/**
* The implementation file for type MSDirectoryRoleFetcher.
*/


@implementation MSDirectoryRoleFetcher
-(MSDirectoryRoleOperations*) getOperations{
	return [[MSDirectoryRoleOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryRole class]];
}


@end