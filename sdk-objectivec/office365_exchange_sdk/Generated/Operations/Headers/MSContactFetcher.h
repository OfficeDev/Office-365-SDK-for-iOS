/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSContactOperations.h"
#import "MSContact.h"

/**
* The header for type MSContactFetcher.
*/

@protocol MSContactFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSContact* contact, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSContact*, NSError * error))callback;
@end

@interface MSContactFetcher : MSODataEntityFetcher<MSContactFetcher>

-(MSContactOperations*) getOperations;
	
@end