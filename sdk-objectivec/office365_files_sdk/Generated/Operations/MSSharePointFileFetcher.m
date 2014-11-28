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

#import "MSSharePointFileFetcher.h"


/**
* The implementation file for type MSSharePointFileFetcher.
*/


@implementation MSSharePointFileFetcher

-(MSSharePointFileOperations*) getOperations{
	return [[MSSharePointFileOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSSharePointFile class]];
}

-(NSURLSessionDataTask*) updateFile:(id)entity withCallback:(void (^)(MSSharePointFile*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteFile:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}


@end