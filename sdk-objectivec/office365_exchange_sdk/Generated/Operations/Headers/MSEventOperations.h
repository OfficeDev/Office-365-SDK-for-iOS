/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSEvent.h"
#import "MSItemOperations.h"
#import "MSItemBody.h"
#import "MSImportance.h"
#import "MSLocation.h"
#import "MSFreeBusyStatus.h"
#import "MSEventType.h"
#import "MSAttendee.h"
#import "MSPatternedRecurrence.h"
#import "MSRecipient.h"
#import "MSAttachment.h"
#import "MSCalendar.h"
#import "MSEvent.h"

/**
* The header for type MSEventOperations.
*/


@interface MSEventOperations : MSItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;
-(NSURLSessionDataTask*)accept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)decline : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)tentativelyAccept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			

@end