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
@class MSDirectoryServicePrincipalFetcher;

#import <core/core.h>
#import "MSDirectoryModels.h"

/**
* The header for type MSDirectoryServicePrincipalCollectionFetcher.
*/

@interface MSDirectoryServicePrincipalCollectionFetcher : MSOrcCollectionFetcher

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent;

- (MSDirectoryServicePrincipalFetcher *)getById:(NSString *)Id;
- (void)add:(MSDirectoryServicePrincipal *)entity callback:(void (^)(MSDirectoryServicePrincipal *servicePrincipal, MSOrcError *error))callback;

- (MSDirectoryServicePrincipalCollectionFetcher *)select:(NSString *)params;
- (MSDirectoryServicePrincipalCollectionFetcher *)filter:(NSString *)params;
- (MSDirectoryServicePrincipalCollectionFetcher *)search:(NSString *)params;
- (MSDirectoryServicePrincipalCollectionFetcher *)top:(int)value;
- (MSDirectoryServicePrincipalCollectionFetcher *)skip:(int)value;
- (MSDirectoryServicePrincipalCollectionFetcher *)expand:(NSString *)value;
- (MSDirectoryServicePrincipalCollectionFetcher *)orderBy:(NSString *)params;
- (MSDirectoryServicePrincipalCollectionFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSDirectoryServicePrincipalCollectionFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;

@end