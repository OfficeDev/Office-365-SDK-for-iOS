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

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;
-(NSURLSessionDataTask*)sendMail : (MSOutlookMessage *) message : (bool) saveToSentItems : (void (^)(int returnValue, NSError *error))callback;			

@end