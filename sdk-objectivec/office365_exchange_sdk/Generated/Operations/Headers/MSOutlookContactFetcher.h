/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookContactOperations.h"
#import "MSOutlookContact.h"

/**
* The header for type MSOutlookContactFetcher.
*/

@protocol MSOutlookContactFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookContact* contact, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookContact*, NSError * error))callback;
@end

@interface MSOutlookContactFetcher : MSOutlookODataEntityFetcher<MSOutlookContactFetcher>

-(MSOutlookContactOperations*) getOperations;
	
@end