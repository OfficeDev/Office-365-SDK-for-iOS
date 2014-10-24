/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSGroupOperations.h"
#import "MSGroup.h"
@class MSAppRoleAssignmentCollectionFetcher;

/**
* The header for type MSGroupFetcher.
*/

@protocol MSGroupFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSGroup* group, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSGroup*, NSError * error))callback;
@end

@interface MSGroupFetcher : MSODataEntityFetcher<MSGroupFetcher>

-(MSGroupOperations*) getOperations;
-(MSAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;
	
@end