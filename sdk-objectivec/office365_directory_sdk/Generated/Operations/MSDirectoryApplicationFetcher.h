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
#import "MSDirectoryApplicationOperations.h"
#import "MSDirectoryApplication.h"
@class MSDirectoryExtensionPropertyCollectionFetcher;


/**
* The header for type MSDirectoryApplicationFetcher.
*/

@protocol MSDirectoryApplicationFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryApplication* application, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryApplication*, NSError * error))callback;
@end

@interface MSDirectoryApplicationFetcher : MSODataEntityFetcher<MSDirectoryApplicationFetcher>

-(MSDirectoryApplicationOperations*) getOperations;

-(MSDirectoryExtensionPropertyCollectionFetcher*) getextensionProperties;

	
@end