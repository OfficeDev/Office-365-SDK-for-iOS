/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryObject.h"
#import "MSODataOperations.h"
#import "MSDirectoryObject.h"

/**
* The header for type MSDirectoryObjectOperations.
*/


@interface MSDirectoryObjectOperations : MSODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;
-(NSURLSessionDataTask*)checkMemberGroups : (NSMutableArray *) groupIds : (void (^)(NSString* result, NSError *error))callback;
-(NSURLSessionDataTask*)getMemberGroups : (bool) securityEnabledOnly : (void (^)(NSString* result, NSError *error))callback;
-(NSURLSessionDataTask*)getMemberObjects : (bool) securityEnabledOnly : (void (^)(NSString* result, NSError *error))callback;			

@end