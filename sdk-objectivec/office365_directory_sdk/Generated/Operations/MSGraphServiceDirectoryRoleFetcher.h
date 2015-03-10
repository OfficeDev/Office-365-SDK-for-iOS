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

@class MSGraphServiceDirectoryObjectFetcher;;
@class MSGraphServiceDirectoryObjectCollectionFetcher;;
@class MSGraphServiceDirectoryRoleOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDirectoryRoleFetcher.
*/


@protocol MSGraphServiceDirectoryRoleFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceDirectoryRole* directoryRole, MSODataException *error))callback;
-(NSURLSessionTask*) updateDirectoryRole:(id)entity withCallback:(void (^)(MSGraphServiceDirectoryRole*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteDirectoryRole:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceDirectoryRoleFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDirectoryRoleFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceDirectoryRoleFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDirectoryRoleFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceDirectoryRoleOperations*) getOperations;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmembers;

-(MSGraphServiceDirectoryObjectFetcher*) getmembersById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmemberOf;

-(MSGraphServiceDirectoryObjectFetcher*) getmemberOfById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getowners;

-(MSGraphServiceDirectoryObjectFetcher*) getownersById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getownedObjects;

-(MSGraphServiceDirectoryObjectFetcher*) getownedObjectsById : (NSString*)_id;
@end

@interface MSGraphServiceDirectoryRoleFetcher : MSODataEntityFetcher<MSGraphServiceDirectoryRoleFetcher>

@end