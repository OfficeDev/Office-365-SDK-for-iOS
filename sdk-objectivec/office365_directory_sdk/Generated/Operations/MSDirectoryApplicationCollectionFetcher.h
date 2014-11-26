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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryApplication> *applications, NSError *error))callback;

@end

@interface MSDirectoryApplicationCollectionFetcher : MSODataCollectionFetcher<MSDirectoryApplicationCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSDirectoryApplication* )entity withCallback:(void (^)(MSDirectoryApplication *application, NSError *e))callback;

-(MSDirectoryApplicationFetcher*)getById:(NSString *)Id;

@end