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

@class MSGraphServiceContactFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceContactCollectionFetcher.
*/

@protocol MSGraphServiceContactCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceContact> *contacts, MSODataException *error))callback;

-(id<MSGraphServiceContactCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceContactCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceContactCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceContactCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceContactCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceContactCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceContactCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceContactCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceContactFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addContact:(MSGraphServiceContact* )entity withCallback:(void (^)(MSGraphServiceContact *contact, MSODataException *e))callback;

@end

@interface MSGraphServiceContactCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceContactCollectionFetcher>

@end