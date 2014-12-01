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
#import "MSSharePointFolder.h"
#import "MSSharePointFolderFetcher.h"

/**
* The header for type MSSharePointFolderCollectionFetcher.
*/

@protocol MSSharePointFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSharePointFolder> *folders, MSODataException *error))callback;

-(id<MSSharePointFolderCollectionFetcher>)select : (NSString*) params;
-(id<MSSharePointFolderCollectionFetcher>)filter : (NSString*) params;
-(id<MSSharePointFolderCollectionFetcher>)top : (int) value;
-(id<MSSharePointFolderCollectionFetcher>)skip : (int) value;
-(id<MSSharePointFolderCollectionFetcher>)expand : (NSString*) value;
-(id<MSSharePointFolderCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSSharePointFolderCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSharePointFolderCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSSharePointFolderCollectionFetcher : MSODataCollectionFetcher<MSSharePointFolderCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSSharePointFolderFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addFolder:(MSSharePointFolder* )entity withCallback:(void (^)(MSSharePointFolder *folder, MSODataException *e))callback;

@end