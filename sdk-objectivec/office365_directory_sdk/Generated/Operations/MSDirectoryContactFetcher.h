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
#import "MSDirectoryContactOperations.h"
#import "MSDirectoryContact.h"


/**
* The header for type MSDirectoryContactFetcher.
*/

@protocol MSDirectoryContactFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryContact* contact, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateContact:(id)entity withCallback:(void (^)(MSDirectoryContact*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteContact:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryContactFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryContactFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectoryContactFetcher : MSODataEntityFetcher<MSDirectoryContactFetcher>

-(MSDirectoryContactOperations*) getOperations;

	
@end