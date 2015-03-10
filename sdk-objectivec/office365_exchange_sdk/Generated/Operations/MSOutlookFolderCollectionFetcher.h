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

@class MSOutlookFolderFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookFolderCollectionFetcher.
*/

@protocol MSOutlookFolderCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSOutlookFolder> *folders, MSODataException *error))callback;

-(id<MSOutlookFolderCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookFolderCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookFolderCollectionFetcher>)top : (int) value;
-(id<MSOutlookFolderCollectionFetcher>)skip : (int) value;
-(id<MSOutlookFolderCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookFolderCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookFolderCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookFolderCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookFolderFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addFolder:(MSOutlookFolder* )entity withCallback:(void (^)(MSOutlookFolder *folder, MSODataException *e))callback;

@end

@interface MSOutlookFolderCollectionFetcher : MSODataCollectionFetcher<MSOutlookFolderCollectionFetcher>

@end