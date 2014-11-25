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
#import "MSODirectoryDirectoryRoleOperations.h"
#import "MSODirectoryDirectoryRole.h"


/**
* The header for type MSODirectoryDirectoryRoleFetcher.
*/

@protocol MSODirectoryDirectoryRoleFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSODirectoryDirectoryRole* directoryRole, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSODirectoryDirectoryRole*, NSError * error))callback;
@end

@interface MSODirectoryDirectoryRoleFetcher : MSODataEntityFetcher<MSODirectoryDirectoryRoleFetcher>

-(MSODirectoryDirectoryRoleOperations*) getOperations;

	
@end