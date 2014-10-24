/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryRole.h"
#import "MSODataCollectionFetcher.h"
#import "MSDirectoryRoleFetcher.h"

/**
* The header for type MSDirectoryRoleCollectionFetcher.
*/

@protocol MSDirectoryRoleCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryRole> *directoryRoles, NSError *error))callback;

@end

@interface MSDirectoryRoleCollectionFetcher : MSODataCollectionFetcher<MSDirectoryRoleCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryRole* )entity :(void (^)(MSDirectoryRole *directoryRole, NSError *e))callback;

-(MSDirectoryRoleFetcher*)getById:(NSString *)Id;

@end
