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

@class MSGraphServiceMessageFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceMessageCollectionFetcher.
*/

@protocol MSGraphServiceMessageCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceMessage> *messages, MSODataException *error))callback;

-(id<MSGraphServiceMessageCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceMessageCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceMessageCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceMessageCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceMessageCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceMessageCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceMessageCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceMessageCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceMessageFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addMessage:(MSGraphServiceMessage* )entity withCallback:(void (^)(MSGraphServiceMessage *message, MSODataException *e))callback;

@end

@interface MSGraphServiceMessageCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceMessageCollectionFetcher>

@end