/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/
@class MSGraphDirectoryObjectFetcher;
@class MSGraphDirectoryObjectCollectionFetcher;
@class MSGraphDirectoryRoleOperations;

#import <core/core.h>
#import "MSGraphModels.h"

/**
* The header for type MSGraphDirectoryRoleFetcher.
*/


@interface MSGraphDirectoryRoleFetcher : MSOrcEntityFetcher

@property (copy, nonatomic, readonly) MSGraphDirectoryRoleOperations *operations;

- (instancetype)initWithUrl:(NSString*)urlComponent parent:(id<MSOrcExecutable>)parent;
- (void) readWithCallback:(void (^)(MSGraphDirectoryRole *directoryRole, MSOrcError *error))callback;
- (void)update:(MSGraphDirectoryRole *)directoryRole callback:(void(^)(MSGraphDirectoryRole *directoryRole, MSOrcError *error))callback;
- (void)delete:(void(^)(int status, MSOrcError *error))callback;
- (MSGraphDirectoryRoleFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSGraphDirectoryRoleFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;
- (MSGraphDirectoryRoleFetcher *)select:(NSString *)params;
- (MSGraphDirectoryRoleFetcher *)expand:(NSString *)value;
@property (retain, nonatomic, readonly, getter=members) MSGraphDirectoryObjectCollectionFetcher *members;

- (MSGraphDirectoryObjectFetcher *)getMembersById:(NSString*)id;

@property (retain, nonatomic, readonly, getter=memberOf) MSGraphDirectoryObjectCollectionFetcher *memberOf;

- (MSGraphDirectoryObjectFetcher *)getMemberOfById:(NSString*)id;

@property (retain, nonatomic, readonly, getter=owners) MSGraphDirectoryObjectCollectionFetcher *owners;

- (MSGraphDirectoryObjectFetcher *)getOwnersById:(NSString*)id;

@property (retain, nonatomic, readonly, getter=ownedObjects) MSGraphDirectoryObjectCollectionFetcher *ownedObjects;

- (MSGraphDirectoryObjectFetcher *)getOwnedObjectsById:(NSString*)id;


@end