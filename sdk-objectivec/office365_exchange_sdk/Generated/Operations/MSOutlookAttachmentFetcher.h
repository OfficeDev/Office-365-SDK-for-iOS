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
#import "MSOutlookAttachmentOperations.h"
#import "MSOutlookAttachment.h"


#import "MSOutlookFileAttachmentFetcher.h"
#import "MSOutlookItemAttachmentFetcher.h"
/**
* The header for type MSOutlookAttachmentFetcher.
*/

@protocol MSOutlookAttachmentFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookAttachment* attachment, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateAttachment:(id)entity withCallback:(void (^)(MSOutlookAttachment*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteAttachment:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookAttachmentFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookAttachmentFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSOutlookAttachmentFetcher : MSODataEntityFetcher<MSOutlookAttachmentFetcher>

-(MSOutlookAttachmentOperations*) getOperations;

	
	
-(MSOutlookFileAttachmentFetcher*) asFileAttachment;	
	
	
-(MSOutlookItemAttachmentFetcher*) asItemAttachment;	
	
@end