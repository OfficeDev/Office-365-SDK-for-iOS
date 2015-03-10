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

@class MSOutlookItemFetcher;;
@class MSOutlookItemAttachmentOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookItemAttachmentFetcher.
*/


@protocol MSOutlookItemAttachmentFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSOutlookItemAttachment* itemAttachment, MSODataException *error))callback;
-(NSURLSessionTask*) updateItemAttachment:(id)entity withCallback:(void (^)(MSOutlookItemAttachment*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteItemAttachment:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookItemAttachmentFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookItemAttachmentFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookItemAttachmentFetcher>)select : (NSString*) params;
-(id<MSOutlookItemAttachmentFetcher>)expand : (NSString*) value;

@required
-(MSOutlookItemAttachmentOperations*) getOperations;
-(MSOutlookItemFetcher*) getItem;
@end

@interface MSOutlookItemAttachmentFetcher : MSODataEntityFetcher<MSOutlookItemAttachmentFetcher>

@end