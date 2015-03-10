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

@class MSGraphServiceExtensionPropertyOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceExtensionPropertyFetcher.
*/


@protocol MSGraphServiceExtensionPropertyFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceExtensionProperty* extensionProperty, MSODataException *error))callback;
-(NSURLSessionTask*) updateExtensionProperty:(id)entity withCallback:(void (^)(MSGraphServiceExtensionProperty*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteExtensionProperty:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceExtensionPropertyFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceExtensionPropertyFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceExtensionPropertyFetcher>)select : (NSString*) params;
-(id<MSGraphServiceExtensionPropertyFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceExtensionPropertyOperations*) getOperations;
@end

@interface MSGraphServiceExtensionPropertyFetcher : MSODataEntityFetcher<MSGraphServiceExtensionPropertyFetcher>

@end