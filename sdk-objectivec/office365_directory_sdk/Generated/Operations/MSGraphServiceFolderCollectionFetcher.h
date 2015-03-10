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

@class MSGraphServiceFolderFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceFolderCollectionFetcher.
*/

@protocol MSGraphServiceFolderCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceFolder> *folders, MSODataException *error))callback;

-(id<MSGraphServiceFolderCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceFolderCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceFolderCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceFolderCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceFolderCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceFolderCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceFolderCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceFolderCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceFolderFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addFolder:(MSGraphServiceFolder* )entity withCallback:(void (^)(MSGraphServiceFolder *folder, MSODataException *e))callback;

@end

@interface MSGraphServiceFolderCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceFolderCollectionFetcher>

@end