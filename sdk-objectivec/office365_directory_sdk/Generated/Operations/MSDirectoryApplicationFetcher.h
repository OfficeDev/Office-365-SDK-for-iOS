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
#import "MSDirectoryApplicationOperations.h"
#import "MSDirectoryApplication.h"
@class MSDirectoryExtensionPropertyCollectionFetcher;


/**
* The header for type MSDirectoryApplicationFetcher.
*/

@protocol MSDirectoryApplicationFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryApplication* application, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateApplication:(id)entity withCallback:(void (^)(MSDirectoryApplication*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteApplication:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryApplicationFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryApplicationFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectoryApplicationFetcher : MSODataEntityFetcher<MSDirectoryApplicationFetcher>

-(MSDirectoryApplicationOperations*) getOperations;

-(MSDirectoryExtensionPropertyCollectionFetcher*) getextensionProperties;

	
@end