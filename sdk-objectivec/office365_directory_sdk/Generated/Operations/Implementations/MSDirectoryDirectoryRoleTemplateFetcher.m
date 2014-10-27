/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryRoleTemplateFetcher.h"


/**
* The implementation file for type MSDirectoryDirectoryRoleTemplateFetcher.
*/


@implementation MSDirectoryDirectoryRoleTemplateFetcher
-(MSDirectoryDirectoryRoleTemplateOperations*) getOperations{
	return [[MSDirectoryDirectoryRoleTemplateOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryDirectoryRoleTemplate class]];
}


@end