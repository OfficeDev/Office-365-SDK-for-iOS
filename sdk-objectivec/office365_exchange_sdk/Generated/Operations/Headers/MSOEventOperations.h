/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEvent.h"
#import "MSOItemOperations.h"
#import "MSOItemBody.h"
#import "MSOImportance.h"
#import "MSOLocation.h"
#import "MSOFreeBusyStatus.h"
#import "MSOEventType.h"
#import "MSOAttendee.h"
#import "MSOPatternedRecurrence.h"
#import "MSORecipient.h"
#import "MSOAttachment.h"
#import "MSOCalendar.h"
#import "MSOEvent.h"

/**
* The header for type MSOEventOperations.
*/


@interface MSOEventOperations : MSOItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)accept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)decline : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)tentativelyAccept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			

@end