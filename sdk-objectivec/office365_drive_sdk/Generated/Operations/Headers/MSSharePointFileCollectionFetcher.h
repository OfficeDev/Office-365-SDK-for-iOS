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

#import "MSSharePointFile.h"
#import "MSSharePointODataCollectionFetcher.h"
#import "MSSharePointFileFetcher.h"

/**
* The header for type MSSharePointFileCollectionFetcher.
*/

@protocol MSSharePointFileCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSharePointFile> *files, NSError *error))callback;

@end

@interface MSSharePointFileCollectionFetcher : MSSharePointODataCollectionFetcher<MSSharePointFileCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSSharePointFile* )entity :(void (^)(MSSharePointFile *file, NSError *e))callback;

-(MSSharePointFileFetcher*)getById:(NSString *)Id;

@end
