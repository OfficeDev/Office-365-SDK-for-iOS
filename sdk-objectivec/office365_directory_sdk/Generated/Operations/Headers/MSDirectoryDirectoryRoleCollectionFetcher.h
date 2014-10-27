/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryRole.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryDirectoryRoleFetcher.h"

/**
* The header for type MSDirectoryDirectoryRoleCollectionFetcher.
*/

@protocol MSDirectoryDirectoryRoleCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryDirectoryRole> *directoryRoles, NSError *error))callback;

@end

@interface MSDirectoryDirectoryRoleCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryDirectoryRoleCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryDirectoryRole* )entity :(void (^)(MSDirectoryDirectoryRole *directoryRole, NSError *e))callback;

-(MSDirectoryDirectoryRoleFetcher*)getById:(NSString *)Id;

@end
