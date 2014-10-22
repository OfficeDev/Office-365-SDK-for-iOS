/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOUser.h"
#import "MSOEntityOperations.h"
#import "MSOFolder.h"
#import "MSOMessage.h"
#import "MSOCalendar.h"
#import "MSOCalendarGroup.h"
#import "MSOEvent.h"
#import "MSOContact.h"
#import "MSOContactFolder.h"

/**
* The header for type MSOUserOperations.
*/


@interface MSOUserOperations : MSOEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)sendMail : (MSOMessage *) message : (bool) saveToSentItems : (void (^)(int returnValue, NSError *error))callback;			

@end