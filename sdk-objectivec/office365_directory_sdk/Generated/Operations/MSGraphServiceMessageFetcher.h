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

@class MSGraphServiceMessageOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceMessageFetcher.
*/


@protocol MSGraphServiceMessageFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceMessage* message, MSODataException *error))callback;
-(NSURLSessionTask*) updateMessage:(id)entity withCallback:(void (^)(MSGraphServiceMessage*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteMessage:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceMessageFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceMessageFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceMessageFetcher>)select : (NSString*) params;
-(id<MSGraphServiceMessageFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceMessageOperations*) getOperations;
@end

@interface MSGraphServiceMessageFetcher : MSODataEntityFetcher<MSGraphServiceMessageFetcher>

@end