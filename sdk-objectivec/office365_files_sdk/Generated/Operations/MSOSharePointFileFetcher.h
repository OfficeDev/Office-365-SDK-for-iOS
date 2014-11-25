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
#import "MSOSharePointFileOperations.h"
#import "MSOSharePointFile.h"


/**
* The header for type MSOSharePointFileFetcher.
*/

@protocol MSOSharePointFileFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOSharePointFile* file, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOSharePointFile*, NSError * error))callback;
@end

@interface MSOSharePointFileFetcher : MSODataMediaEntityFetcher<MSOSharePointFileFetcher>

-(MSOSharePointFileOperations*) getOperations;

	
@end