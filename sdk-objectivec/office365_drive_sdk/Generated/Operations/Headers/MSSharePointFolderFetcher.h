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

#import "MSSharePointODataEntityFetcher.h"
#import "MSSharePointFolderOperations.h"
#import "MSSharePointFolder.h"
@class MSSharePointItemCollectionFetcher;

/**
* The header for type MSSharePointFolderFetcher.
*/

@protocol MSSharePointFolderFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSSharePointFolder* folder, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSSharePointFolder*, NSError * error))callback;
@end

@interface MSSharePointFolderFetcher : MSSharePointODataEntityFetcher<MSSharePointFolderFetcher>

-(MSSharePointFolderOperations*) getOperations;
-(MSSharePointItemCollectionFetcher*) getchildren;
	
@end