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

#import "MSDirectoryApplicationFetcher.h"
#import "MSDirectoryExtensionPropertyCollectionFetcher.h"


/**
* The implementation file for type MSDirectoryApplicationFetcher.
*/


@implementation MSDirectoryApplicationFetcher

-(MSDirectoryApplicationOperations*) getOperations{
	return [[MSDirectoryApplicationOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSDirectoryApplication class]];
}

-(NSURLSessionDataTask*) updateApplication:(id)entity withCallback:(void (^)(MSDirectoryApplication*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteApplication:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}


-(MSDirectoryExtensionPropertyCollectionFetcher*) getextensionProperties{
    return [[MSDirectoryExtensionPropertyCollectionFetcher alloc] initWithUrl:@"extensionProperties" parent:self andEntityClass:[MSDirectoryExtensionProperty class]];
}


@end