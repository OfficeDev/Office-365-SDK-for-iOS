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
#import "MSOSharePointFile.h"
#import "MSOSharePointFileFetcher.h"

/**
* The header for type MSOSharePointFileCollectionFetcher.
*/

@protocol MSOSharePointFileCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOSharePointFile> *files, NSError *error))callback;

@end

@interface MSOSharePointFileCollectionFetcher : MSODataCollectionFetcher<MSOSharePointFileCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOSharePointFile* )entity withCallback:(void (^)(MSOSharePointFile *file, NSError *e))callback;

-(MSOSharePointFileFetcher*)getById:(NSString *)Id;

@end