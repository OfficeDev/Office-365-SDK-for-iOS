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
#import "MSODirectoryGroup.h"
#import "MSODirectoryGroupFetcher.h"

/**
* The header for type MSODirectoryGroupCollectionFetcher.
*/

@protocol MSODirectoryGroupCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryGroup> *groups, NSError *error))callback;

@end

@interface MSODirectoryGroupCollectionFetcher : MSODataCollectionFetcher<MSODirectoryGroupCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryGroup* )entity withCallback:(void (^)(MSODirectoryGroup *group, NSError *e))callback;

-(MSODirectoryGroupFetcher*)getById:(NSString *)Id;

@end