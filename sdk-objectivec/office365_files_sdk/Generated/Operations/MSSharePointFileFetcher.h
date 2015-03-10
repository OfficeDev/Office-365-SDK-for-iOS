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

@class MSSharePointFileOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSSharePointModels.h"

/**
* The header for type MSSharePointFileFetcher.
*/


@protocol MSSharePointFileFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSSharePointFile* file, MSODataException *error))callback;
-(NSURLSessionTask*) updateFile:(id)entity withCallback:(void (^)(MSSharePointFile*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteFile:(void (^)(int status, MSODataException * error))callback;
-(id<MSSharePointFileFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSharePointFileFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSSharePointFileFetcher>)select : (NSString*) params;
-(id<MSSharePointFileFetcher>)expand : (NSString*) value;

@required
-(MSSharePointFileOperations*) getOperations;
@end

@interface MSSharePointFileFetcher : MSODataMediaEntityFetcher<MSSharePointFileFetcher>

@end