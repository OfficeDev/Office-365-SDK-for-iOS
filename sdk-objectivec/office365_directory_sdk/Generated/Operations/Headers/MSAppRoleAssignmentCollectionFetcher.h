/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSAppRoleAssignment.h"
#import "MSODataCollectionFetcher.h"
#import "MSAppRoleAssignmentFetcher.h"

/**
* The header for type MSAppRoleAssignmentCollectionFetcher.
*/

@protocol MSAppRoleAssignmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSAppRoleAssignment> *appRoleAssignments, NSError *error))callback;

@end

@interface MSAppRoleAssignmentCollectionFetcher : MSODataCollectionFetcher<MSAppRoleAssignmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSAppRoleAssignment* )entity :(void (^)(MSAppRoleAssignment *appRoleAssignment, NSError *e))callback;

-(MSAppRoleAssignmentFetcher*)getById:(NSString *)Id;

@end
