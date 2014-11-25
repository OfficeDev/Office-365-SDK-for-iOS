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
#import "MSOSharePointItemOperations.h"
#import "MSOSharePointItem.h"


#import "MSOSharePointFileFetcher.h"
#import "MSOSharePointFolderFetcher.h"
/**
* The header for type MSOSharePointItemFetcher.
*/

@protocol MSOSharePointItemFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOSharePointItem* item, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOSharePointItem*, NSError * error))callback;
@end

@interface MSOSharePointItemFetcher : MSODataEntityFetcher<MSOSharePointItemFetcher>

-(MSOSharePointItemOperations*) getOperations;

	
	
-(MSOSharePointFileFetcher*) asFile;	
	
	
-(MSOSharePointFolderFetcher*) asFolder;	
	
@end