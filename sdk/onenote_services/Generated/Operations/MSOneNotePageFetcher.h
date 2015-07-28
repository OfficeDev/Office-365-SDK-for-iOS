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
@class MSOneNoteSectionFetcher;
@class MSOneNoteNotebookFetcher;
@class MSOneNotePageOperations;

#import <core/core.h>
#import "MSOneNoteModels.h"

/**
* The header for type MSOneNotePageFetcher.
*/


@interface MSOneNotePageFetcher : MSOrcMediaEntityFetcher

@property (copy, nonatomic, readonly) MSOneNotePageOperations *operations;

- (instancetype)initWithUrl:(NSString*)urlComponent parent:(id<MSOrcExecutable>)parent;
- (void) readWithCallback:(void (^)(MSOneNotePage *page, MSOrcError *error))callback;
- (void)update:(MSOneNotePage *)page callback:(void(^)(MSOneNotePage *page, MSOrcError *error))callback;
- (void)delete:(void(^)(int status, MSOrcError *error))callback;
- (MSOneNotePageFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSOneNotePageFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;
- (MSOneNotePageFetcher *)select:(NSString *)params;
- (MSOneNotePageFetcher *)expand:(NSString *)value;

@property (retain, nonatomic, readonly, getter=parentSection) MSOneNoteSectionFetcher *parentSection;

@property (retain, nonatomic, readonly, getter=parentNotebook) MSOneNoteNotebookFetcher *parentNotebook;

@end