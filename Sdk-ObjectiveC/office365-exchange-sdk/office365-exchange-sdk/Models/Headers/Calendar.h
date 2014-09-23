//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Entity.h"



@class Event;

@interface Calendar : Entity	


@property NSString *Name;

@property NSString *ChangeKey;

@property NSMutableArray<Event> *Events;


@end