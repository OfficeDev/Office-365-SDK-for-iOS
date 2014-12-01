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
#import "MSDirectoryDirectoryLinkChange.h"
#import "MSDirectoryDirectoryLinkChangeFetcher.h"

/**
* The header for type MSDirectoryDirectoryLinkChangeCollectionFetcher.
*/

@protocol MSDirectoryDirectoryLinkChangeCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryDirectoryLinkChange> *directoryLinkChanges, MSODataException *error))callback;

-(id<MSDirectoryDirectoryLinkChangeCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryDirectoryLinkChangeCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryDirectoryLinkChangeCollectionFetcher>)top : (int) value;
-(id<MSDirectoryDirectoryLinkChangeCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryDirectoryLinkChangeCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryDirectoryLinkChangeCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryDirectoryLinkChangeCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryDirectoryLinkChangeCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryDirectoryLinkChangeCollectionFetcher : MSODataCollectionFetcher<MSDirectoryDirectoryLinkChangeCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryDirectoryLinkChangeFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addDirectoryLinkChange:(MSDirectoryDirectoryLinkChange* )entity withCallback:(void (^)(MSDirectoryDirectoryLinkChange *directoryLinkChange, MSODataException *e))callback;

@end