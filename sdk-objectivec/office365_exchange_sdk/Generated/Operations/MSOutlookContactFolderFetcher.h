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
@class MSOutlookContactFetcher;

/**
* The header for type MSOutlookContactFolderFetcher.
*/

@protocol MSOutlookContactFolderFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookContactFolder* contactFolder, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateContactFolder:(id)entity withCallback:(void (^)(MSOutlookContactFolder*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteContactFolder:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookContactFolderFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookContactFolderFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookContactFolderFetcher>)select : (NSString*) params;
-(id<MSOutlookContactFolderFetcher>)expand : (NSString*) value;
@end

@interface MSOutlookContactFolderFetcher : MSODataEntityFetcher<MSOutlookContactFolderFetcher>

-(MSOutlookContactFolderOperations*) getOperations;

-(MSOutlookContactCollectionFetcher*) getContacts;

-(MSOutlookContactFetcher*) getContactsById : (NSString*)_id;

-(MSOutlookContactFolderCollectionFetcher*) getChildFolders;

-(MSOutlookContactFolderFetcher*) getChildFoldersById : (NSString*)_id;

	
@end