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

@class MSGraphServiceApplicationFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceApplicationCollectionFetcher.
*/

@protocol MSGraphServiceApplicationCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceApplication> *applications, MSODataException *error))callback;

-(id<MSGraphServiceApplicationCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceApplicationCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceApplicationCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceApplicationCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceApplicationCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceApplicationCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceApplicationCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceApplicationCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceApplicationFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addApplication:(MSGraphServiceApplication* )entity withCallback:(void (^)(MSGraphServiceApplication *application, MSODataException *e))callback;

@end

@interface MSGraphServiceApplicationCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceApplicationCollectionFetcher>

@end