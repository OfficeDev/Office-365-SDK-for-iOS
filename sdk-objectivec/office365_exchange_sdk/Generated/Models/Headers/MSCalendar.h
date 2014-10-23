/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSEvent;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSEntity.h"

/**
* The header for type Calendar.
*/

@interface MSCalendar : MSEntity
@property NSString *Name;
@property NSString *ChangeKey;

@end