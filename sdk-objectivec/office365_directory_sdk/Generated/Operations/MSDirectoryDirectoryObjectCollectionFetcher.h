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
#import "MSDirectoryDirectoryObject.h"
#import "MSDirectoryDirectoryObjectFetcher.h"

/**
* The header for type MSDirectoryDirectoryObjectCollectionFetcher.
*/

@protocol MSDirectoryDirectoryObjectCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryDirectoryObject> *directoryObjects, MSODataException *error))callback;

-(id<MSDirectoryDirectoryObjectCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryDirectoryObjectCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryDirectoryObjectCollectionFetcher>)top : (int) value;
-(id<MSDirectoryDirectoryObjectCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryDirectoryObjectCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryDirectoryObjectCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryDirectoryObjectCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryDirectoryObjectCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryDirectoryObjectCollectionFetcher : MSODataCollectionFetcher<MSDirectoryDirectoryObjectCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryDirectoryObjectFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addDirectoryObject:(MSDirectoryDirectoryObject* )entity withCallback:(void (^)(MSDirectoryDirectoryObject *directoryObject, MSODataException *e))callback;

@end