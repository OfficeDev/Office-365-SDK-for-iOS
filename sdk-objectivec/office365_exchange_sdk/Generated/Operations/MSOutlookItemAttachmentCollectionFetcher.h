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

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookItemAttachment.h"
#import "MSOutlookItemAttachmentFetcher.h"

/**
* The header for type MSOutlookItemAttachmentCollectionFetcher.
*/

@protocol MSOutlookItemAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookItemAttachment> *itemAttachments, MSODataException *error))callback;

-(id<MSOutlookItemAttachmentCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookItemAttachmentCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookItemAttachmentCollectionFetcher>)top : (int) value;
-(id<MSOutlookItemAttachmentCollectionFetcher>)skip : (int) value;
-(id<MSOutlookItemAttachmentCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookItemAttachmentCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookItemAttachmentCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookItemAttachmentCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSOutlookItemAttachmentCollectionFetcher : MSODataCollectionFetcher<MSOutlookItemAttachmentCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookItemAttachmentFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addItemAttachment:(MSOutlookItemAttachment* )entity withCallback:(void (^)(MSOutlookItemAttachment *itemAttachment, MSODataException *e))callback;

@end