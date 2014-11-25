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
#import "MSOSharePointFolder.h"
#import "MSOSharePointFolderFetcher.h"

/**
* The header for type MSOSharePointFolderCollectionFetcher.
*/

@protocol MSOSharePointFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOSharePointFolder> *folders, NSError *error))callback;

@end

@interface MSOSharePointFolderCollectionFetcher : MSODataCollectionFetcher<MSOSharePointFolderCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOSharePointFolder* )entity withCallback:(void (^)(MSOSharePointFolder *folder, NSError *e))callback;

-(MSOSharePointFolderFetcher*)getById:(NSString *)Id;

@end