/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSDirectoryDirectoryRoleFetcher.h"


/**
* The implementation file for type MSDirectoryDirectoryRoleFetcher.
*/


@implementation MSDirectoryDirectoryRoleFetcher

-(MSDirectoryDirectoryRoleOperations*) getOperations{
	return [[MSDirectoryDirectoryRoleOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSDirectoryDirectoryRole class]];
}

-(NSURLSessionDataTask*) updateDirectoryRole:(id)entity withCallback:(void (^)(MSDirectoryDirectoryRole*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteDirectoryRole:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}


@end