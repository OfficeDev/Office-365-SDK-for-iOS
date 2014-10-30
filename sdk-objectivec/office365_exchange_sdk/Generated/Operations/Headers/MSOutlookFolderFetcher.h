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

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookFolderOperations.h"
#import "MSOutlookFolder.h"
@class MSOutlookFolderCollectionFetcher;
@class MSOutlookMessageCollectionFetcher;

/**
* The header for type MSOutlookFolderFetcher.
*/

@protocol MSOutlookFolderFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookFolder* folder, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookFolder*, NSError * error))callback;
@end

@interface MSOutlookFolderFetcher : MSOutlookODataEntityFetcher<MSOutlookFolderFetcher>

-(MSOutlookFolderOperations*) getOperations;
-(MSOutlookFolderCollectionFetcher*) getChildFolders;
-(MSOutlookMessageCollectionFetcher*) getMessages;
	
@end