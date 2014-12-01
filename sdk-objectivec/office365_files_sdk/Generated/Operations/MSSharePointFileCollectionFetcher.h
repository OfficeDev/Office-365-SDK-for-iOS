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
#import "MSSharePointFile.h"
#import "MSSharePointFileFetcher.h"

/**
* The header for type MSSharePointFileCollectionFetcher.
*/

@protocol MSSharePointFileCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSharePointFile> *files, MSODataException *error))callback;

-(id<MSSharePointFileCollectionFetcher>)select : (NSString*) params;
-(id<MSSharePointFileCollectionFetcher>)filter : (NSString*) params;
-(id<MSSharePointFileCollectionFetcher>)top : (int) value;
-(id<MSSharePointFileCollectionFetcher>)skip : (int) value;
-(id<MSSharePointFileCollectionFetcher>)expand : (NSString*) value;
-(id<MSSharePointFileCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSSharePointFileCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSharePointFileCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSSharePointFileCollectionFetcher : MSODataCollectionFetcher<MSSharePointFileCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSSharePointFileFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addFile:(MSSharePointFile* )entity withCallback:(void (^)(MSSharePointFile *file, MSODataException *e))callback;

@end