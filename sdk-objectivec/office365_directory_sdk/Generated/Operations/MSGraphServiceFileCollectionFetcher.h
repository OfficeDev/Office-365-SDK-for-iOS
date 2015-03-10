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

@class MSGraphServiceFileFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceFileCollectionFetcher.
*/

@protocol MSGraphServiceFileCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceFile> *files, MSODataException *error))callback;

-(id<MSGraphServiceFileCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceFileCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceFileCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceFileCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceFileCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceFileCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceFileCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceFileCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceFileFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addFile:(MSGraphServiceFile* )entity withCallback:(void (^)(MSGraphServiceFile *file, MSODataException *e))callback;

@end

@interface MSGraphServiceFileCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceFileCollectionFetcher>

@end