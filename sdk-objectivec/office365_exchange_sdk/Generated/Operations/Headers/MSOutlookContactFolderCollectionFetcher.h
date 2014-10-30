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

#import "MSOutlookContactFolder.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookContactFolderFetcher.h"

/**
* The header for type MSOutlookContactFolderCollectionFetcher.
*/

@protocol MSOutlookContactFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookContactFolder> *contactFolders, NSError *error))callback;

@end

@interface MSOutlookContactFolderCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookContactFolderCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookContactFolder* )entity :(void (^)(MSOutlookContactFolder *contactFolder, NSError *e))callback;

-(MSOutlookContactFolderFetcher*)getById:(NSString *)Id;

@end
