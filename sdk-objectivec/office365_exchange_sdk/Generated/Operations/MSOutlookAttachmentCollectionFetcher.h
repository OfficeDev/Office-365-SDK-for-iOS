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

@class MSOutlookAttachmentFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookAttachmentCollectionFetcher.
*/

@protocol MSOutlookAttachmentCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSOutlookAttachment> *attachments, MSODataException *error))callback;

-(id<MSOutlookAttachmentCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookAttachmentCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookAttachmentCollectionFetcher>)top : (int) value;
-(id<MSOutlookAttachmentCollectionFetcher>)skip : (int) value;
-(id<MSOutlookAttachmentCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookAttachmentCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookAttachmentCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookAttachmentCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookAttachmentFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addAttachment:(MSOutlookAttachment* )entity withCallback:(void (^)(MSOutlookAttachment *attachment, MSODataException *e))callback;

@end

@interface MSOutlookAttachmentCollectionFetcher : MSODataCollectionFetcher<MSOutlookAttachmentCollectionFetcher>

@end