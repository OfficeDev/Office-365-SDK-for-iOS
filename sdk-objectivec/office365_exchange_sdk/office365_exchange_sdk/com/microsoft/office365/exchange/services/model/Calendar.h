/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Entity.h"
@class Event;


@interface Calendar : Entity	

@property NSString *Name;
@property NSString *ChangeKey;

@end