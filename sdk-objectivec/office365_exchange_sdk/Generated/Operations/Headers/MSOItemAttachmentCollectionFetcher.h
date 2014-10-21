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


@protocol MSOItemAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOItemAttachment> *itemAttachments, NSError *error))callback;

@end

@interface MSOItemAttachmentCollectionFetcher : MSOODataCollectionFetcher<MSOItemAttachmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOItemAttachment* )entity :(void (^)(MSOItemAttachment *itemAttachment, NSError *e))callback;

-(MSOItemAttachmentFetcher*)getById:(NSString *)Id;

@end
