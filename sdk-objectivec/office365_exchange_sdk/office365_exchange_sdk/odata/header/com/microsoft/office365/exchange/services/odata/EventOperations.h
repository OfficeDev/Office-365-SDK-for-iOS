/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ODataOperations.h"
#import "ItemBody.h"
#import "Importance.h"
#import "Location.h"
#import "FreeBusyStatus.h"
#import "EventType.h"
#import "Attendee.h"
#import "PatternedRecurrence.h"
#import "Recipient.h"
#import "Attachment.h"
#import "Calendar.h"

@interface EventOperations : ODataOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(NSURLSessionDataTask*)accept : (NSString *) Comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)decline : (NSString *) Comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)tentativelyAccept : (NSString *) Comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)instances : (NSDate *) StartDate : (NSDate *) EndDate : (void (^)(Event *event, NSError *error))callback;			

@end