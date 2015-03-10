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

@class MSGraphServiceDirectoryRoleFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDirectoryRoleCollectionFetcher.
*/

@protocol MSGraphServiceDirectoryRoleCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceDirectoryRole> *directoryRoles, MSODataException *error))callback;

-(id<MSGraphServiceDirectoryRoleCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDirectoryRoleCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceDirectoryRoleCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceDirectoryRoleCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceDirectoryRoleCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceDirectoryRoleCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceDirectoryRoleCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDirectoryRoleCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceDirectoryRoleFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addDirectoryRole:(MSGraphServiceDirectoryRole* )entity withCallback:(void (^)(MSGraphServiceDirectoryRole *directoryRole, MSODataException *e))callback;

@end

@interface MSGraphServiceDirectoryRoleCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceDirectoryRoleCollectionFetcher>

@end