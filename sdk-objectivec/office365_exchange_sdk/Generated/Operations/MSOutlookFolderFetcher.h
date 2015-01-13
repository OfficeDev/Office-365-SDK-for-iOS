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
#import "MSOutlookFolderOperations.h"
#import "MSOutlookFolder.h"
@class MSOutlookFolderCollectionFetcher;
@class MSOutlookMessageCollectionFetcher;
@class MSOutlookMessageFetcher;

/**
* The header for type MSOutlookFolderFetcher.
*/

@protocol MSOutlookFolderFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookFolder* folder, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateFolder:(id)entity withCallback:(void (^)(MSOutlookFolder*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteFolder:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookFolderFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookFolderFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookFolderFetcher>)select : (NSString*) params;
-(id<MSOutlookFolderFetcher>)expand : (NSString*) value;
@end

@interface MSOutlookFolderFetcher : MSODataEntityFetcher<MSOutlookFolderFetcher>

-(MSOutlookFolderOperations*) getOperations;

-(MSOutlookFolderCollectionFetcher*) getChildFolders;

-(MSOutlookFolderFetcher*) getChildFoldersById : (NSString*)_id;

-(MSOutlookMessageCollectionFetcher*) getMessages;

-(MSOutlookMessageFetcher*) getMessagesById : (NSString*)_id;

	
@end