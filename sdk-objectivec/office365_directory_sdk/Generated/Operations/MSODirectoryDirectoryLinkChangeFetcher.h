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
#import "MSODirectoryDirectoryLinkChangeOperations.h"
#import "MSODirectoryDirectoryLinkChange.h"


/**
* The header for type MSODirectoryDirectoryLinkChangeFetcher.
*/

@protocol MSODirectoryDirectoryLinkChangeFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSODirectoryDirectoryLinkChange* directoryLinkChange, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSODirectoryDirectoryLinkChange*, NSError * error))callback;
@end

@interface MSODirectoryDirectoryLinkChangeFetcher : MSODataEntityFetcher<MSODirectoryDirectoryLinkChangeFetcher>

-(MSODirectoryDirectoryLinkChangeOperations*) getOperations;

	
@end