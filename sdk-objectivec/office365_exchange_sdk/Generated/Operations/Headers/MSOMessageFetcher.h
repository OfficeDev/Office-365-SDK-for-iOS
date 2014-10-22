/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOMessageOperations.h"
#import "MSOMessage.h"
@class MSOAttachmentCollectionFetcher;

/**
* The header for type MSOMessageFetcher.
*/


@protocol MSOMessageFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOMessage* message, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOMessage*, NSError * error))callback;
@end

@interface MSOMessageFetcher : MSOODataEntityFetcher<MSOMessageFetcher>

-(MSOMessageOperations*) getOperations;

-(MSOAttachmentCollectionFetcher*) getAttachments;
@end