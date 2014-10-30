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

#import "MSSharePointFolder.h"
#import "MSSharePointODataCollectionFetcher.h"
#import "MSSharePointFolderFetcher.h"

/**
* The header for type MSSharePointFolderCollectionFetcher.
*/

@protocol MSSharePointFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSharePointFolder> *folders, NSError *error))callback;

@end

@interface MSSharePointFolderCollectionFetcher : MSSharePointODataCollectionFetcher<MSSharePointFolderCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSSharePointFolder* )entity :(void (^)(MSSharePointFolder *folder, NSError *e))callback;

-(MSSharePointFolderFetcher*)getById:(NSString *)Id;

@end
