//
//  MeetingMessageType.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface NSObject ()

typedef enum {
	MeetingMessageType_None = 0,
	MeetingMessageType_MeetingRequest = 1,
	MeetingMessageType_MeetingCancelled = 2,
	MeetingMessageType_MeetingAccepted = 3,
	MeetingMessageType_MeetingTenativelyAccepted = 4,
	MeetingMessageType_MeetingDeclined = 5,
} MeetingMessageType;
@end

