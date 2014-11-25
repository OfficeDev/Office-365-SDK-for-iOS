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
#import "MSODirectoryDirectoryObject.h"
#import "MSODirectoryDirectoryObjectFetcher.h"

/**
* The header for type MSODirectoryDirectoryObjectCollectionFetcher.
*/

@protocol MSODirectoryDirectoryObjectCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryDirectoryObject> *directoryObjects, NSError *error))callback;

@end

@interface MSODirectoryDirectoryObjectCollectionFetcher : MSODataCollectionFetcher<MSODirectoryDirectoryObjectCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryDirectoryObject* )entity withCallback:(void (^)(MSODirectoryDirectoryObject *directoryObject, NSError *e))callback;

-(MSODirectoryDirectoryObjectFetcher*)getById:(NSString *)Id;

@end