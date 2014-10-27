/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryExtensionPropertyOperations.h"
#import "MSDirectoryExtensionProperty.h"

/**
* The header for type MSDirectoryExtensionPropertyFetcher.
*/

@protocol MSDirectoryExtensionPropertyFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryExtensionProperty* extensionProperty, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryExtensionProperty*, NSError * error))callback;
@end

@interface MSDirectoryExtensionPropertyFetcher : MSDirectoryODataEntityFetcher<MSDirectoryExtensionPropertyFetcher>

-(MSDirectoryExtensionPropertyOperations*) getOperations;
	
@end