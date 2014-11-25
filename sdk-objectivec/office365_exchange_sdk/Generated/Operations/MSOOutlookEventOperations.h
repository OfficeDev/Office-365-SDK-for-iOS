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
#import "MSOOutlookEvent.h"
#import "MSOOutlookItemOperations.h"

#import "MSOOutlookItemBody.h"
#import "MSOOutlookImportance.h"
#import "MSOOutlookLocation.h"
#import "MSOOutlookFreeBusyStatus.h"
#import "MSOOutlookEventType.h"
#import "MSOOutlookAttendee.h"
#import "MSOOutlookPatternedRecurrence.h"
#import "MSOOutlookRecipient.h"
#import "MSOOutlookAttachment.h"
#import "MSOOutlookCalendar.h"
#import "MSOOutlookEvent.h"

/**
* The header for type MSOOutlookEventOperations.
*/

@interface MSOOutlookEventOperations : MSOOutlookItemOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)accept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			

-(NSURLSessionDataTask*)decline : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			

-(NSURLSessionDataTask*)tentativelyAccept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			

@end