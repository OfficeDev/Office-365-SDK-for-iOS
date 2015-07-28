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
@class MSOneNoteSiteCollectionFetcher;

#import <core/core.h>
#import "MSOneNoteModels.h"

/**
* The header for type MSOneNoteSiteCollectionCollectionFetcher.
*/

@interface MSOneNoteSiteCollectionCollectionFetcher : MSOrcCollectionFetcher

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent;

- (MSOneNoteSiteCollectionFetcher *)getById:(NSString *)Id;
- (void)add:(MSOneNoteSiteCollection *)entity callback:(void (^)(MSOneNoteSiteCollection *siteCollection, MSOrcError *error))callback;

- (MSOneNoteSiteCollectionCollectionFetcher *)select:(NSString *)params;
- (MSOneNoteSiteCollectionCollectionFetcher *)filter:(NSString *)params;
- (MSOneNoteSiteCollectionCollectionFetcher *)search:(NSString *)params;
- (MSOneNoteSiteCollectionCollectionFetcher *)top:(int)value;
- (MSOneNoteSiteCollectionCollectionFetcher *)skip:(int)value;
- (MSOneNoteSiteCollectionCollectionFetcher *)expand:(NSString *)value;
- (MSOneNoteSiteCollectionCollectionFetcher *)orderBy:(NSString *)params;
- (MSOneNoteSiteCollectionCollectionFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSOneNoteSiteCollectionCollectionFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;

@end