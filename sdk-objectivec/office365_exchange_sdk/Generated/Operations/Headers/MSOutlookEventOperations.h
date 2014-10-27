/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

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

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;
-(NSURLSessionDataTask*)accept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)decline : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)tentativelyAccept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			

@end