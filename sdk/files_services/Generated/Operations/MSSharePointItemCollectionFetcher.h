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
@class MSSharePointItemFetcher;

#import <core/core.h>
#import "MSSharePointModels.h"

/**
* The header for type MSSharePointItemCollectionFetcher.
*/

@interface MSSharePointItemCollectionFetcher : MSOrcCollectionFetcher

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent;

- (MSSharePointItemFetcher *)getById:(NSString *)Id;
- (void)add:(MSSharePointItem *)entity callback:(void (^)(MSSharePointItem *item, MSOrcError *error))callback;

- (MSSharePointItemCollectionFetcher *)select:(NSString *)params;
- (MSSharePointItemCollectionFetcher *)filter:(NSString *)params;
- (MSSharePointItemCollectionFetcher *)search:(NSString *)params;
- (MSSharePointItemCollectionFetcher *)top:(int)value;
- (MSSharePointItemCollectionFetcher *)skip:(int)value;
- (MSSharePointItemCollectionFetcher *)expand:(NSString *)value;
- (MSSharePointItemCollectionFetcher *)orderBy:(NSString *)params;
- (MSSharePointItemCollectionFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSSharePointItemCollectionFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;

@end