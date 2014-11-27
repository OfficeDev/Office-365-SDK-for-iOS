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

#import <office365_odata_base/office365_odata_base.h>
#import "MSDirectoryDirectoryLinkChangeOperations.h"
#import "MSDirectoryDirectoryLinkChange.h"


/**
* The header for type MSDirectoryDirectoryLinkChangeFetcher.
*/

@protocol MSDirectoryDirectoryLinkChangeFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryDirectoryLinkChange* directoryLinkChange, NSError *error))callback;
-(NSURLSessionDataTask*) updateDirectoryLinkChange:(id)entity withCallback:(void (^)(MSDirectoryDirectoryLinkChange*, NSError * error))callback;
-(NSURLSessionDataTask*) deleteDirectoryLinkChange:(void (^)(int status, NSError * error))callback;

@end

@interface MSDirectoryDirectoryLinkChangeFetcher : MSODataEntityFetcher<MSDirectoryDirectoryLinkChangeFetcher>

-(MSDirectoryDirectoryLinkChangeOperations*) getOperations;

	
@end