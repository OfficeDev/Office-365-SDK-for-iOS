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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookContactFolder> *contactFolders, NSError *error))callback;
-(MSOutlookContactFolderFetcher*)select : (NSString*) params;
-(MSOutlookContactFolderFetcher*)filter : (NSString*) params;
-(MSOutlookContactFolderFetcher*)top : (int) value;
-(MSOutlookContactFolderFetcher*)skip : (int) value;
-(MSOutlookContactFolderFetcher*)expand : (NSString*) value;
-(MSOutlookContactFolderFetcher*)orderBy : (NSString*) params;

@end

@interface MSOutlookContactFolderCollectionFetcher : MSODataCollectionFetcher<MSOutlookContactFolderCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addContactFolder:(MSOutlookContactFolder* )entity withCallback:(void (^)(MSOutlookContactFolder *contactFolder, NSError *e))callback;

-(MSOutlookContactFolderFetcher*)getById:(NSString *)Id;

@end