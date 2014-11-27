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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryAppRoleAssignment> *appRoleAssignments, NSError *error))callback;
-(MSDirectoryAppRoleAssignmentFetcher*)select : (NSString*) params;
-(MSDirectoryAppRoleAssignmentFetcher*)filter : (NSString*) params;
-(MSDirectoryAppRoleAssignmentFetcher*)top : (int) value;
-(MSDirectoryAppRoleAssignmentFetcher*)skip : (int) value;
-(MSDirectoryAppRoleAssignmentFetcher*)expand : (NSString*) value;
-(MSDirectoryAppRoleAssignmentFetcher*)orderBy : (NSString*) params;

@end

@interface MSDirectoryAppRoleAssignmentCollectionFetcher : MSODataCollectionFetcher<MSDirectoryAppRoleAssignmentCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addAppRoleAssignment:(MSDirectoryAppRoleAssignment* )entity withCallback:(void (^)(MSDirectoryAppRoleAssignment *appRoleAssignment, NSError *e))callback;

-(MSDirectoryAppRoleAssignmentFetcher*)getById:(NSString *)Id;

@end