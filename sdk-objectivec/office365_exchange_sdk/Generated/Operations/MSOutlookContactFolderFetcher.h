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

@class MSOutlookContactFetcher;;
@class MSOutlookContactCollectionFetcher;;
@class MSOutlookContactFolderFetcher;;
@class MSOutlookContactFolderCollectionFetcher;;
@class MSOutlookContactFolderOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookContactFolderFetcher.
*/


@protocol MSOutlookContactFolderFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSOutlookContactFolder* contactFolder, MSODataException *error))callback;
-(NSURLSessionTask*) updateContactFolder:(id)entity withCallback:(void (^)(MSOutlookContactFolder*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteContactFolder:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookContactFolderFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookContactFolderFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookContactFolderFetcher>)select : (NSString*) params;
-(id<MSOutlookContactFolderFetcher>)expand : (NSString*) value;

@required
-(MSOutlookContactFolderOperations*) getOperations;
-(MSOutlookContactCollectionFetcher*) getContacts;

-(MSOutlookContactFetcher*) getContactsById : (NSString*)_id;
-(MSOutlookContactFolderCollectionFetcher*) getChildFolders;

-(MSOutlookContactFolderFetcher*) getChildFoldersById : (NSString*)_id;
@end

@interface MSOutlookContactFolderFetcher : MSODataEntityFetcher<MSOutlookContactFolderFetcher>

@end