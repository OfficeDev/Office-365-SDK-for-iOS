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

@class MSGraphServiceFolderOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceFolderFetcher.
*/


@protocol MSGraphServiceFolderFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceFolder* folder, MSODataException *error))callback;
-(NSURLSessionTask*) updateFolder:(id)entity withCallback:(void (^)(MSGraphServiceFolder*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteFolder:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceFolderFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceFolderFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceFolderFetcher>)select : (NSString*) params;
-(id<MSGraphServiceFolderFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceFolderOperations*) getOperations;
@end

@interface MSGraphServiceFolderFetcher : MSODataEntityFetcher<MSGraphServiceFolderFetcher>

@end