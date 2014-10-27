/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOutlookEmailAddress;

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"


/**
* The header for type Recipient.
*/

@interface MSOutlookRecipient : NSObject

@property NSString *$$__ODataType;
@property MSOutlookEmailAddress *EmailAddress;

@end