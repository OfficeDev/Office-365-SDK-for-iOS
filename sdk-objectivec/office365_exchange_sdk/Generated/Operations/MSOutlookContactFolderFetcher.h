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
#import "MSOutlookContactFolderOperations.h"
#import "MSOutlookContactFolder.h"
@class MSOutlookContactCollectionFetcher;
@class MSOutlookContactFolderCollectionFetcher;


/**
* The header for type MSOutlookContactFolderFetcher.
*/

@protocol MSOutlookContactFolderFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookContactFolder* contactFolder, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookContactFolder*, NSError * error))callback;
@end

@interface MSOutlookContactFolderFetcher : MSODataEntityFetcher<MSOutlookContactFolderFetcher>

-(MSOutlookContactFolderOperations*) getOperations;

-(MSOutlookContactCollectionFetcher*) getContacts;

-(MSOutlookContactFolderCollectionFetcher*) getChildFolders;

	
@end