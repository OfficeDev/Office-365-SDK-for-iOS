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

@class MSGraphServiceUserFetcher;;
@class MSGraphServiceFileFetcher;;
@class MSGraphServiceFolderFetcher;;
@class MSGraphServiceItemOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceItemFetcher.
*/


@protocol MSGraphServiceItemFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceItem* item, MSODataException *error))callback;
-(NSURLSessionTask*) updateItem:(id)entity withCallback:(void (^)(MSGraphServiceItem*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteItem:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceItemFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceItemFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceItemFetcher>)select : (NSString*) params;
-(id<MSGraphServiceItemFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceItemOperations*) getOperations;
-(MSGraphServiceUserFetcher*) getcreatedByUser;
-(MSGraphServiceUserFetcher*) getlastModifiedByUser;
	
-(MSGraphServiceFileFetcher*) asFile;	
	
-(MSGraphServiceFolderFetcher*) asFolder;	
@end

@interface MSGraphServiceItemFetcher : MSODataEntityFetcher<MSGraphServiceItemFetcher>

@end