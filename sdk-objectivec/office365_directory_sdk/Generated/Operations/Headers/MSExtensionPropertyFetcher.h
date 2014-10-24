/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSExtensionPropertyOperations.h"
#import "MSExtensionProperty.h"

/**
* The header for type MSExtensionPropertyFetcher.
*/

@protocol MSExtensionPropertyFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSExtensionProperty* extensionProperty, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSExtensionProperty*, NSError * error))callback;
@end

@interface MSExtensionPropertyFetcher : MSODataEntityFetcher<MSExtensionPropertyFetcher>

-(MSExtensionPropertyOperations*) getOperations;
	
@end