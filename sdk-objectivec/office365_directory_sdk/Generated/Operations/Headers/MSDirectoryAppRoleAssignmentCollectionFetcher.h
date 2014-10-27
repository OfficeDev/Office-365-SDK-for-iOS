/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryAppRoleAssignment.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryAppRoleAssignmentFetcher.h"

/**
* The header for type MSDirectoryAppRoleAssignmentCollectionFetcher.
*/

@protocol MSDirectoryAppRoleAssignmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryAppRoleAssignment> *appRoleAssignments, NSError *error))callback;

@end

@interface MSDirectoryAppRoleAssignmentCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryAppRoleAssignmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryAppRoleAssignment* )entity :(void (^)(MSDirectoryAppRoleAssignment *appRoleAssignment, NSError *e))callback;

-(MSDirectoryAppRoleAssignmentFetcher*)getById:(NSString *)Id;

@end
