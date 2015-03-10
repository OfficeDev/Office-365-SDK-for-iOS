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

@class MSGraphServiceDirectoryObjectFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDirectoryObjectCollectionFetcher.
*/

@protocol MSGraphServiceDirectoryObjectCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceDirectoryObject> *directoryObjects, MSODataException *error))callback;

-(id<MSGraphServiceDirectoryObjectCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDirectoryObjectCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceDirectoryObjectCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceDirectoryObjectCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceDirectoryObjectCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceDirectoryObjectCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceDirectoryObjectCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDirectoryObjectCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceDirectoryObjectFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addDirectoryObject:(MSGraphServiceDirectoryObject* )entity withCallback:(void (^)(MSGraphServiceDirectoryObject *directoryObject, MSODataException *e))callback;

@end

@interface MSGraphServiceDirectoryObjectCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceDirectoryObjectCollectionFetcher>

@end