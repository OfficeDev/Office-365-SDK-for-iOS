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
#import "MSDirectoryGroup.h"
#import "MSDirectoryGroupFetcher.h"

/**
* The header for type MSDirectoryGroupCollectionFetcher.
*/

@protocol MSDirectoryGroupCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryGroup> *groups, NSError *error))callback;

-(id<MSDirectoryGroupCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryGroupCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryGroupCollectionFetcher>)top : (int) value;
-(id<MSDirectoryGroupCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryGroupCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryGroupCollectionFetcher>)orderBy : (NSString*) params;

@end

@interface MSDirectoryGroupCollectionFetcher : MSODataCollectionFetcher<MSDirectoryGroupCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;
-(MSDirectoryGroupFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addGroup:(MSDirectoryGroup* )entity withCallback:(void (^)(MSDirectoryGroup *group, NSError *e))callback;

@end