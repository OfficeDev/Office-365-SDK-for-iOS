/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOEmailAddress;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type Recipient.
*/

@interface MSORecipient : NSObject<MSORecipient>

@property MSOEmailAddress *EmailAddress;

@end