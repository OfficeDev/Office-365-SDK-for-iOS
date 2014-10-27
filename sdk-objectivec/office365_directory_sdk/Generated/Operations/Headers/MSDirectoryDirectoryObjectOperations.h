/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryObject.h"
#import "MSDirectoryODataOperations.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type MSDirectoryDirectoryObjectOperations.
*/


@interface MSDirectoryDirectoryObjectOperations : MSDirectoryODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;
-(NSURLSessionDataTask*)checkMemberGroups : (NSMutableArray *) groupIds : (void (^)(NSArray*r, NSError *error))callback;
-(NSURLSessionDataTask*)getMemberGroups : (bool) securityEnabledOnly : (void (^)(NSArray*r, NSError *error))callback;
-(NSURLSessionDataTask*)getMemberObjects : (bool) securityEnabledOnly : (void (^)(NSArray *r, NSError *error))callback;

@end