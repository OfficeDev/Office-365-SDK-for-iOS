/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ODataOperations.h"
#import "Folder.h"
#import "Message.h"
#import "Calendar.h"
#import "CalendarGroup.h"
#import "Event.h"
#import "Contact.h"
#import "ContactFolder.h"

@interface UserOperations : ODataOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(NSURLSessionDataTask*)sendMail : (Message *) Message : (bool ) SaveToSentItems : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)calendarView : (NSDate *) StartDate : (NSDate *) EndDate : (void (^)(Event *event, NSError *error))callback;			

@end