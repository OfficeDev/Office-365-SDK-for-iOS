//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface NSObject ()

typedef enum {

	None,

	MeetingRequest,

	MeetingCancelled,

	MeetingAccepted,

	MeetingTenativelyAccepted,

	MeetingDeclined

} MeetingMessageType;

@end