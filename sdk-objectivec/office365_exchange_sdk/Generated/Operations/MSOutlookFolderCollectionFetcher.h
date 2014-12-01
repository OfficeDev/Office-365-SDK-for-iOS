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
#import "MSOutlookFolder.h"
#import "MSOutlookFolderFetcher.h"

/**
* The header for type MSOutlookFolderCollectionFetcher.
*/

@protocol MSOutlookFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookFolder> *folders, MSODataException *error))callback;

-(id<MSOutlookFolderCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookFolderCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookFolderCollectionFetcher>)top : (int) value;
-(id<MSOutlookFolderCollectionFetcher>)skip : (int) value;
-(id<MSOutlookFolderCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookFolderCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookFolderCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookFolderCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSOutlookFolderCollectionFetcher : MSODataCollectionFetcher<MSOutlookFolderCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookFolderFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addFolder:(MSOutlookFolder* )entity withCallback:(void (^)(MSOutlookFolder *folder, MSODataException *e))callback;

@end