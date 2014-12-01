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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryDirectoryRole> *directoryRoles, MSODataException *error))callback;

-(id<MSDirectoryDirectoryRoleCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryDirectoryRoleCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryDirectoryRoleCollectionFetcher>)top : (int) value;
-(id<MSDirectoryDirectoryRoleCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryDirectoryRoleCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryDirectoryRoleCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryDirectoryRoleCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryDirectoryRoleCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryDirectoryRoleCollectionFetcher : MSODataCollectionFetcher<MSDirectoryDirectoryRoleCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryDirectoryRoleFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addDirectoryRole:(MSDirectoryDirectoryRole* )entity withCallback:(void (^)(MSDirectoryDirectoryRole *directoryRole, MSODataException *e))callback;

@end