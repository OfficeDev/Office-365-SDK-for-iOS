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

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookMessageOperations.h"
#import "MSOutlookMessage.h"
@class MSOutlookAttachmentCollectionFetcher;

/**
* The header for type MSOutlookMessageFetcher.
*/

@protocol MSOutlookMessageFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookMessage* message, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookMessage*, NSError * error))callback;
@end

@interface MSOutlookMessageFetcher : MSOutlookODataEntityFetcher<MSOutlookMessageFetcher>

-(MSOutlookMessageOperations*) getOperations;
-(MSOutlookAttachmentCollectionFetcher*) getAttachments;
	
@end