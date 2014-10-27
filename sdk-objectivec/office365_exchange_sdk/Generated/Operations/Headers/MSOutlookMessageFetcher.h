/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookMessageOperations.h"
#import "MSOutlookMessage.h"
@class MSOutlookAttachmentCollectionFetcher;

/**
* The header for type MSOutlookMessageFetcher.
*/

@protocol MSOutlookMessageFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookMessage* message, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookMessage*, NSError * error))callback;
@end

@interface MSOutlookMessageFetcher : MSOutlookODataEntityFetcher<MSOutlookMessageFetcher>

-(MSOutlookMessageOperations*) getOperations;
-(MSOutlookAttachmentCollectionFetcher*) getAttachments;
	
@end