/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSEmailAddress;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type Recipient.
*/

@interface MSRecipient : NSObject
@property NSString *$$__ODataType;
@property MSEmailAddress *EmailAddress;

@end