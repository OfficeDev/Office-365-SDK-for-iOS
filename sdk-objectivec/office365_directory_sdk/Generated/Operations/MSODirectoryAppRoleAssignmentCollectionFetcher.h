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
#import "MSODirectoryAppRoleAssignment.h"
#import "MSODirectoryAppRoleAssignmentFetcher.h"

/**
* The header for type MSODirectoryAppRoleAssignmentCollectionFetcher.
*/

@protocol MSODirectoryAppRoleAssignmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryAppRoleAssignment> *appRoleAssignments, NSError *error))callback;

@end

@interface MSODirectoryAppRoleAssignmentCollectionFetcher : MSODataCollectionFetcher<MSODirectoryAppRoleAssignmentCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryAppRoleAssignment* )entity withCallback:(void (^)(MSODirectoryAppRoleAssignment *appRoleAssignment, NSError *e))callback;

-(MSODirectoryAppRoleAssignmentFetcher*)getById:(NSString *)Id;

@end