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
@class MSSharePointFileFetcher;

#import <core/core.h>
#import "MSSharePointModels.h"

/**
* The header for type MSSharePointFileCollectionFetcher.
*/

@interface MSSharePointFileCollectionFetcher : MSOrcCollectionFetcher

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent;

- (MSSharePointFileFetcher *)getById:(NSString *)Id;
- (void)add:(MSSharePointFile *)entity callback:(void (^)(MSSharePointFile *file, MSOrcError *error))callback;

- (MSSharePointFileCollectionFetcher *)select:(NSString *)params;
- (MSSharePointFileCollectionFetcher *)filter:(NSString *)params;
- (MSSharePointFileCollectionFetcher *)search:(NSString *)params;
- (MSSharePointFileCollectionFetcher *)top:(int)value;
- (MSSharePointFileCollectionFetcher *)skip:(int)value;
- (MSSharePointFileCollectionFetcher *)expand:(NSString *)value;
- (MSSharePointFileCollectionFetcher *)orderBy:(NSString *)params;
- (MSSharePointFileCollectionFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSSharePointFileCollectionFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;

@end