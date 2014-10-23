/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSUser.h"
#import "MSEntityOperations.h"
#import "MSFolder.h"
#import "MSMessage.h"
#import "MSCalendar.h"
#import "MSCalendarGroup.h"
#import "MSEvent.h"
#import "MSContact.h"
#import "MSContactFolder.h"

/**
* The header for type MSUserOperations.
*/


@interface MSUserOperations : MSEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;
-(NSURLSessionDataTask*)sendMail : (MSMessage *) message : (bool) saveToSentItems : (void (^)(int returnValue, NSError *error))callback;			

@end