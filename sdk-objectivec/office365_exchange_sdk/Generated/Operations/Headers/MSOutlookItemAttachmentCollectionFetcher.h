/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookItemAttachment.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookItemAttachmentFetcher.h"

/**
* The header for type MSOutlookItemAttachmentCollectionFetcher.
*/

@protocol MSOutlookItemAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookItemAttachment> *itemAttachments, NSError *error))callback;

@end

@interface MSOutlookItemAttachmentCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookItemAttachmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookItemAttachment* )entity :(void (^)(MSOutlookItemAttachment *itemAttachment, NSError *e))callback;

-(MSOutlookItemAttachmentFetcher*)getById:(NSString *)Id;

@end
