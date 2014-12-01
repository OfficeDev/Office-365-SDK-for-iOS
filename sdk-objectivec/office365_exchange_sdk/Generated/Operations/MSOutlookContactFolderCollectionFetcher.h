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
#import "MSOutlookContactFolder.h"
#import "MSOutlookContactFolderFetcher.h"

/**
* The header for type MSOutlookContactFolderCollectionFetcher.
*/

@protocol MSOutlookContactFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookContactFolder> *contactFolders, MSODataException *error))callback;

-(id<MSOutlookContactFolderCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookContactFolderCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookContactFolderCollectionFetcher>)top : (int) value;
-(id<MSOutlookContactFolderCollectionFetcher>)skip : (int) value;
-(id<MSOutlookContactFolderCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookContactFolderCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookContactFolderCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookContactFolderCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSOutlookContactFolderCollectionFetcher : MSODataCollectionFetcher<MSOutlookContactFolderCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookContactFolderFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addContactFolder:(MSOutlookContactFolder* )entity withCallback:(void (^)(MSOutlookContactFolder *contactFolder, MSODataException *e))callback;

@end