/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSMessageOperations.h"
#import "MSMessage.h"
@class MSAttachmentCollectionFetcher;

/**
* The header for type MSMessageFetcher.
*/

@protocol MSMessageFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSMessage* message, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSMessage*, NSError * error))callback;
@end

@interface MSMessageFetcher : MSODataEntityFetcher<MSMessageFetcher>

-(MSMessageOperations*) getOperations;
-(MSAttachmentCollectionFetcher*) getAttachments;
	
@end