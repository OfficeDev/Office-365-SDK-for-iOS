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
#import "MSODirectoryDirectoryRole.h"
#import "MSODirectoryDirectoryRoleFetcher.h"

/**
* The header for type MSODirectoryDirectoryRoleCollectionFetcher.
*/

@protocol MSODirectoryDirectoryRoleCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryDirectoryRole> *directoryRoles, NSError *error))callback;

@end

@interface MSODirectoryDirectoryRoleCollectionFetcher : MSODataCollectionFetcher<MSODirectoryDirectoryRoleCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryDirectoryRole* )entity withCallback:(void (^)(MSODirectoryDirectoryRole *directoryRole, NSError *e))callback;

-(MSODirectoryDirectoryRoleFetcher*)getById:(NSString *)Id;

@end