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

@class MSGraphServiceSubscribedSkuOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceSubscribedSkuFetcher.
*/


@protocol MSGraphServiceSubscribedSkuFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceSubscribedSku* subscribedSku, MSODataException *error))callback;
-(NSURLSessionTask*) updateSubscribedSku:(id)entity withCallback:(void (^)(MSGraphServiceSubscribedSku*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteSubscribedSku:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceSubscribedSkuFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceSubscribedSkuFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceSubscribedSkuFetcher>)select : (NSString*) params;
-(id<MSGraphServiceSubscribedSkuFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceSubscribedSkuOperations*) getOperations;
@end

@interface MSGraphServiceSubscribedSkuFetcher : MSODataEntityFetcher<MSGraphServiceSubscribedSkuFetcher>

@end