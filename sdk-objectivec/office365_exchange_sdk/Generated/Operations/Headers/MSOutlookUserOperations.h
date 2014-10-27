/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookUser.h"
#import "MSOutlookEntityOperations.h"
#import "MSOutlookFolder.h"
#import "MSOutlookMessage.h"
#import "MSOutlookCalendar.h"
#import "MSOutlookCalendarGroup.h"
#import "MSOutlookEvent.h"
#import "MSOutlookContact.h"
#import "MSOutlookContactFolder.h"

/**
* The header for type MSOutlookUserOperations.
*/


@interface MSOutlookUserOperations : MSOutlookEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;
-(NSURLSessionDataTask*)sendMail : (MSOutlookMessage *) message : (bool) saveToSentItems : (void (^)(int returnValue, NSError *error))callback;			

@end