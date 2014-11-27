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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryDirectoryObject> *directoryObjects, NSError *error))callback;
-(MSDirectoryDirectoryObjectFetcher*)select : (NSString*) params;
-(MSDirectoryDirectoryObjectFetcher*)filter : (NSString*) params;
-(MSDirectoryDirectoryObjectFetcher*)top : (int) value;
-(MSDirectoryDirectoryObjectFetcher*)skip : (int) value;
-(MSDirectoryDirectoryObjectFetcher*)expand : (NSString*) value;
-(MSDirectoryDirectoryObjectFetcher*)orderBy : (NSString*) params;

@end

@interface MSDirectoryDirectoryObjectCollectionFetcher : MSODataCollectionFetcher<MSDirectoryDirectoryObjectCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addDirectoryObject:(MSDirectoryDirectoryObject* )entity withCallback:(void (^)(MSDirectoryDirectoryObject *directoryObject, NSError *e))callback;

-(MSDirectoryDirectoryObjectFetcher*)getById:(NSString *)Id;

@end