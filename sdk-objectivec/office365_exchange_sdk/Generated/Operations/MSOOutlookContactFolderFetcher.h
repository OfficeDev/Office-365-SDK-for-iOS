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
#import "MSOOutlookContactFolderOperations.h"
#import "MSOOutlookContactFolder.h"
@class MSOOutlookContactCollectionFetcher;
@class MSOOutlookContactFolderCollectionFetcher;


/**
* The header for type MSOOutlookContactFolderFetcher.
*/

@protocol MSOOutlookContactFolderFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOOutlookContactFolder* contactFolder, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOOutlookContactFolder*, NSError * error))callback;
@end

@interface MSOOutlookContactFolderFetcher : MSODataEntityFetcher<MSOOutlookContactFolderFetcher>

-(MSOOutlookContactFolderOperations*) getOperations;

-(MSOOutlookContactCollectionFetcher*) getContacts;

-(MSOOutlookContactFolderCollectionFetcher*) getChildFolders;

	
@end