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

#import "MSOutlookFolder.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookFolderFetcher.h"

/**
* The header for type MSOutlookFolderCollectionFetcher.
*/

@protocol MSOutlookFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookFolder> *folders, NSError *error))callback;

@end

@interface MSOutlookFolderCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookFolderCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookFolder* )entity :(void (^)(MSOutlookFolder *folder, NSError *e))callback;

-(MSOutlookFolderFetcher*)getById:(NSString *)Id;

@end
