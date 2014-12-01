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
#import "MSSharePointFileOperations.h"
#import "MSSharePointFile.h"


/**
* The header for type MSSharePointFileFetcher.
*/

@protocol MSSharePointFileFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSSharePointFile* file, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateFile:(id)entity withCallback:(void (^)(MSSharePointFile*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteFile:(void (^)(int status, MSODataException * error))callback;
-(id<MSSharePointFileFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSharePointFileFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSSharePointFileFetcher : MSODataMediaEntityFetcher<MSSharePointFileFetcher>

-(MSSharePointFileOperations*) getOperations;

	
@end