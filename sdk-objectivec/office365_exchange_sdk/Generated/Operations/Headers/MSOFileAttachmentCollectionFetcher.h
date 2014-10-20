/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFileAttachment.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOFileAttachmentFetcher.h"

/**
* The header for type MSOFileAttachmentCollectionFetcher.
*/

@interface MSOFileAttachmentCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOFileAttachment* )entity :(void (^)(MSOFileAttachment *fileAttachment, NSError *e))callback;

-(MSOFileAttachmentFetcher*)getById:(NSString *)Id;
@end
