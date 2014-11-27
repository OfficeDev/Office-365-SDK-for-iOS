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
#import "MSDirectoryDirectoryRole.h"
#import "MSDirectoryDirectoryRoleFetcher.h"

/**
* The header for type MSDirectoryDirectoryRoleCollectionFetcher.
*/

@protocol MSDirectoryDirectoryRoleCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryDirectoryRole> *directoryRoles, NSError *error))callback;
-(MSDirectoryDirectoryRoleFetcher*)select : (NSString*) params;
-(MSDirectoryDirectoryRoleFetcher*)filter : (NSString*) params;
-(MSDirectoryDirectoryRoleFetcher*)top : (int) value;
-(MSDirectoryDirectoryRoleFetcher*)skip : (int) value;
-(MSDirectoryDirectoryRoleFetcher*)expand : (NSString*) value;
-(MSDirectoryDirectoryRoleFetcher*)orderBy : (NSString*) params;

@end

@interface MSDirectoryDirectoryRoleCollectionFetcher : MSODataCollectionFetcher<MSDirectoryDirectoryRoleCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addDirectoryRole:(MSDirectoryDirectoryRole* )entity withCallback:(void (^)(MSDirectoryDirectoryRole *directoryRole, NSError *e))callback;

-(MSDirectoryDirectoryRoleFetcher*)getById:(NSString *)Id;

@end