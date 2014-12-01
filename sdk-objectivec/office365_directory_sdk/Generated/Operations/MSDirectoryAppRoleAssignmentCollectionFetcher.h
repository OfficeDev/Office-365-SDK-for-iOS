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
#import "MSDirectoryAppRoleAssignment.h"
#import "MSDirectoryAppRoleAssignmentFetcher.h"

/**
* The header for type MSDirectoryAppRoleAssignmentCollectionFetcher.
*/

@protocol MSDirectoryAppRoleAssignmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryAppRoleAssignment> *appRoleAssignments, MSODataException *error))callback;

-(id<MSDirectoryAppRoleAssignmentCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryAppRoleAssignmentCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryAppRoleAssignmentCollectionFetcher>)top : (int) value;
-(id<MSDirectoryAppRoleAssignmentCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryAppRoleAssignmentCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryAppRoleAssignmentCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryAppRoleAssignmentCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryAppRoleAssignmentCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryAppRoleAssignmentCollectionFetcher : MSODataCollectionFetcher<MSDirectoryAppRoleAssignmentCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryAppRoleAssignmentFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addAppRoleAssignment:(MSDirectoryAppRoleAssignment* )entity withCallback:(void (^)(MSDirectoryAppRoleAssignment *appRoleAssignment, MSODataException *e))callback;

@end