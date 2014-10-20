/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOItemAttachment.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOItemAttachmentFetcher.h"

/**
* The header for type MSOItemAttachmentCollectionFetcher.
*/

@interface MSOItemAttachmentCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOItemAttachment* )entity :(void (^)(MSOItemAttachment *itemAttachment, NSError *e))callback;

-(MSOItemAttachmentFetcher*)getById:(NSString *)Id;
@end
