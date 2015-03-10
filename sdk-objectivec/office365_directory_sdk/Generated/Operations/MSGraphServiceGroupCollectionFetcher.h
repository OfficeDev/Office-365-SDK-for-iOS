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

@class MSGraphServiceGroupFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceGroupCollectionFetcher.
*/

@protocol MSGraphServiceGroupCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceGroup> *groups, MSODataException *error))callback;

-(id<MSGraphServiceGroupCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceGroupCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceGroupCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceGroupCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceGroupCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceGroupCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceGroupCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceGroupCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceGroupFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addGroup:(MSGraphServiceGroup* )entity withCallback:(void (^)(MSGraphServiceGroup *group, MSODataException *e))callback;

@end

@interface MSGraphServiceGroupCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceGroupCollectionFetcher>

@end