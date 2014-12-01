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

#import <office365_odata_base/office365_odata_base.h>
#import "MSDirectoryGroupOperations.h"
#import "MSDirectoryGroup.h"
@class MSDirectoryAppRoleAssignmentCollectionFetcher;


/**
* The header for type MSDirectoryGroupFetcher.
*/

@protocol MSDirectoryGroupFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryGroup* group, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateGroup:(id)entity withCallback:(void (^)(MSDirectoryGroup*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteGroup:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryGroupFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryGroupFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectoryGroupFetcher : MSODataEntityFetcher<MSDirectoryGroupFetcher>

-(MSDirectoryGroupOperations*) getOperations;

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;

	
@end