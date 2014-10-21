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


@protocol MSOFileAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOFileAttachment> *FileAttachment, NSError *error))callback;

@end

@interface MSOFileAttachmentCollectionFetcher : MSOODataCollectionFetcher<MSOFileAttachmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOFileAttachment* )entity :(void (^)(MSOFileAttachment *fileAttachment, NSError *e))callback;

-(MSOFileAttachmentFetcher*)getById:(NSString *)Id;

@end
