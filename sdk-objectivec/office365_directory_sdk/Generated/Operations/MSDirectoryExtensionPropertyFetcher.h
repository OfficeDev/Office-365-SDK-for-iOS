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
#import "MSDirectoryExtensionPropertyOperations.h"
#import "MSDirectoryExtensionProperty.h"


/**
* The header for type MSDirectoryExtensionPropertyFetcher.
*/

@protocol MSDirectoryExtensionPropertyFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryExtensionProperty* extensionProperty, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateExtensionProperty:(id)entity withCallback:(void (^)(MSDirectoryExtensionProperty*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteExtensionProperty:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryExtensionPropertyFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryExtensionPropertyFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectoryExtensionPropertyFetcher : MSODataEntityFetcher<MSDirectoryExtensionPropertyFetcher>

-(MSDirectoryExtensionPropertyOperations*) getOperations;

	
@end