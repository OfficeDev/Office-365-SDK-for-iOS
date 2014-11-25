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
#import "MSODirectoryApplication.h"
#import "MSODirectoryApplicationFetcher.h"

/**
* The header for type MSODirectoryApplicationCollectionFetcher.
*/

@protocol MSODirectoryApplicationCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryApplication> *applications, NSError *error))callback;

@end

@interface MSODirectoryApplicationCollectionFetcher : MSODataCollectionFetcher<MSODirectoryApplicationCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryApplication* )entity withCallback:(void (^)(MSODirectoryApplication *application, NSError *e))callback;

-(MSODirectoryApplicationFetcher*)getById:(NSString *)Id;

@end