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

@class MSOutlookFolderFetcher;;
@class MSOutlookFolderCollectionFetcher;;
@class MSOutlookMessageFetcher;;
@class MSOutlookMessageCollectionFetcher;;
@class MSOutlookFolderOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookFolderFetcher.
*/


@protocol MSOutlookFolderFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSOutlookFolder* folder, MSODataException *error))callback;
-(NSURLSessionTask*) updateFolder:(id)entity withCallback:(void (^)(MSOutlookFolder*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteFolder:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookFolderFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookFolderFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookFolderFetcher>)select : (NSString*) params;
-(id<MSOutlookFolderFetcher>)expand : (NSString*) value;

@required
-(MSOutlookFolderOperations*) getOperations;
-(MSOutlookFolderCollectionFetcher*) getChildFolders;

-(MSOutlookFolderFetcher*) getChildFoldersById : (NSString*)_id;
-(MSOutlookMessageCollectionFetcher*) getMessages;

-(MSOutlookMessageFetcher*) getMessagesById : (NSString*)_id;
@end

@interface MSOutlookFolderFetcher : MSODataEntityFetcher<MSOutlookFolderFetcher>

@end