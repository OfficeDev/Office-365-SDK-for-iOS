/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOItemAttachment.h"
#import "MSOItemAttachmentFetcher.h"

/**
* The header for type MSOItemAttachmentCollectionFetcher.
*/

@interface MSOItemAttachmentCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOItemAttachment> *ItemAttachment, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOItemAttachment* )entity :(void (^)(MSOItemAttachment *itemAttachment, NSError *e))callback;

-(MSOItemAttachmentFetcher*)getById:(NSString *)Id;
@end
