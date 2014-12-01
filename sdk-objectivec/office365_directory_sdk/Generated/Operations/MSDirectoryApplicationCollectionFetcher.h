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
#import "MSDirectoryApplication.h"
#import "MSDirectoryApplicationFetcher.h"

/**
* The header for type MSDirectoryApplicationCollectionFetcher.
*/

@protocol MSDirectoryApplicationCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryApplication> *applications, MSODataException *error))callback;

-(id<MSDirectoryApplicationCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryApplicationCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryApplicationCollectionFetcher>)top : (int) value;
-(id<MSDirectoryApplicationCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryApplicationCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryApplicationCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryApplicationCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryApplicationCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryApplicationCollectionFetcher : MSODataCollectionFetcher<MSDirectoryApplicationCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryApplicationFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addApplication:(MSDirectoryApplication* )entity withCallback:(void (^)(MSDirectoryApplication *application, MSODataException *e))callback;

@end