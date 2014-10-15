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

@interface MSOMessageFetcher : MSOODataEntityFetcher

-(MSOMessageOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOMessage* message, NSError *error))callback;

-(MSOAttachmentCollectionFetcher*) getAttachments;
@end