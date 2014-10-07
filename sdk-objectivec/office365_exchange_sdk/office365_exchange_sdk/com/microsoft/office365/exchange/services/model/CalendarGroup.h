/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Entity.h"
@class Calendar;


@interface CalendarGroup : Entity	

@property NSString *Name;
@property NSString *ChangeKey;
@property NSString *ClassId;

@end