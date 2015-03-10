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

@class MSGraphServiceUserFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceUserCollectionFetcher.
*/

@protocol MSGraphServiceUserCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceUser> *users, MSODataException *error))callback;

-(id<MSGraphServiceUserCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceUserCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceUserCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceUserCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceUserCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceUserCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceUserCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceUserCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceUserFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addUser:(MSGraphServiceUser* )entity withCallback:(void (^)(MSGraphServiceUser *user, MSODataException *e))callback;

@end

@interface MSGraphServiceUserCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceUserCollectionFetcher>

@end