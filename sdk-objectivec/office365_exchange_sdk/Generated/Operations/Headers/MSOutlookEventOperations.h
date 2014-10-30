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

#import "MSOutlookEvent.h"
#import "MSOutlookItemOperations.h"
#import "MSOutlookItemBody.h"
#import "MSOutlookImportance.h"
#import "MSOutlookLocation.h"
#import "MSOutlookFreeBusyStatus.h"
#import "MSOutlookEventType.h"
#import "MSOutlookAttendee.h"
#import "MSOutlookPatternedRecurrence.h"
#import "MSOutlookRecipient.h"
#import "MSOutlookAttachment.h"
#import "MSOutlookCalendar.h"
#import "MSOutlookEvent.h"

/**
* The header for type MSOutlookEventOperations.
*/


@interface MSOutlookEventOperations : MSOutlookItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;
-(NSURLSessionDataTask*)accept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)decline : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)tentativelyAccept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			

@end