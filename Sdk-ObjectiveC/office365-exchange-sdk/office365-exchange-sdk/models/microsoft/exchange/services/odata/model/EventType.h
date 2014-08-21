//
//  EventType.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface NSObject ()

typedef enum {
	EventType_SingleInstance = 0,
	EventType_Occurrence = 1,
	EventType_Exception = 2,
	EventType_SeriesMaster = 3,
} EventType;
@end

