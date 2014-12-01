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
#import "MSOutlookItemAttachmentOperations.h"
#import "MSOutlookItemAttachment.h"
@class MSOutlookItemFetcher;


/**
* The header for type MSOutlookItemAttachmentFetcher.
*/

@protocol MSOutlookItemAttachmentFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookItemAttachment* itemAttachment, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateItemAttachment:(id)entity withCallback:(void (^)(MSOutlookItemAttachment*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteItemAttachment:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookItemAttachmentFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookItemAttachmentFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSOutlookItemAttachmentFetcher : MSODataEntityFetcher<MSOutlookItemAttachmentFetcher>

-(MSOutlookItemAttachmentOperations*) getOperations;

-(MSOutlookItemFetcher*) getItem;

	
@end