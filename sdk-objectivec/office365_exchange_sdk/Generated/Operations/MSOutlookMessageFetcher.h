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

@class MSOutlookAttachmentFetcher;;
@class MSOutlookAttachmentCollectionFetcher;;
@class MSOutlookMessageOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookMessageFetcher.
*/


@protocol MSOutlookMessageFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSOutlookMessage* message, MSODataException *error))callback;
-(NSURLSessionTask*) updateMessage:(id)entity withCallback:(void (^)(MSOutlookMessage*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteMessage:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookMessageFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookMessageFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookMessageFetcher>)select : (NSString*) params;
-(id<MSOutlookMessageFetcher>)expand : (NSString*) value;

@required
-(MSOutlookMessageOperations*) getOperations;
-(MSOutlookAttachmentCollectionFetcher*) getAttachments;

-(MSOutlookAttachmentFetcher*) getAttachmentsById : (NSString*)_id;
@end

@interface MSOutlookMessageFetcher : MSODataEntityFetcher<MSOutlookMessageFetcher>

@end