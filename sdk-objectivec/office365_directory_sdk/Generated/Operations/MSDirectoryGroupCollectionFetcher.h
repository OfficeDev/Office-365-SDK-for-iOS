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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryGroup> *groups, MSODataException *error))callback;

-(id<MSDirectoryGroupCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryGroupCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryGroupCollectionFetcher>)top : (int) value;
-(id<MSDirectoryGroupCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryGroupCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryGroupCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryGroupCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryGroupCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryGroupCollectionFetcher : MSODataCollectionFetcher<MSDirectoryGroupCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryGroupFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addGroup:(MSDirectoryGroup* )entity withCallback:(void (^)(MSDirectoryGroup *group, MSODataException *e))callback;

@end