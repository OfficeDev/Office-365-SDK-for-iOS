/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataOperations.h"
#import "MSOUser.h"
#import "MSOFolder.h"
#import "MSOMessage.h"
#import "MSOCalendar.h"
#import "MSOCalendarGroup.h"
#import "MSOEvent.h"
#import "MSOContact.h"
#import "MSOContactFolder.h"

@interface MSOUserOperations : MSOODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)sendMail : (MSOMessage *) message : (bool) saveToSentItems : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)calendarView : (NSDate *) startDate : (NSDate *) endDate : (void (^)(MSOEvent *event, NSError *error))callback;			

@end