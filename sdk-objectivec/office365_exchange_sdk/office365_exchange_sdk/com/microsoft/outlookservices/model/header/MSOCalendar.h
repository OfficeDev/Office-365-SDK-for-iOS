/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOEvent;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSOEntity.h"

/**
* The header for type Calendar.
*/

@interface MSOCalendar : MSOEntity
@property NSString *Name;
@property NSString *ChangeKey;

@end