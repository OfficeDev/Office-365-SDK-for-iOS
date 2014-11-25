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

#import <office365_odata_base/office365_odata_base.h>
#import "MSOOutlookUser.h"
#import "MSOOutlookEntityOperations.h"

#import "MSOOutlookFolder.h"
#import "MSOOutlookMessage.h"
#import "MSOOutlookCalendar.h"
#import "MSOOutlookCalendarGroup.h"
#import "MSOOutlookEvent.h"
#import "MSOOutlookContact.h"
#import "MSOOutlookContactFolder.h"

/**
* The header for type MSOOutlookUserOperations.
*/

@interface MSOOutlookUserOperations : MSOOutlookEntityOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)sendMail : (MSOOutlookMessage *) message : (bool) saveToSentItems : (void (^)(int returnValue, NSError *error))callback;			

@end