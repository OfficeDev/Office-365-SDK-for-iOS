//
//  ResponseType.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface NSObject ()

typedef enum {
	ResponseType_None = 0,
	ResponseType_Organizer = 1,
	ResponseType_TentativelyAccepted = 2,
	ResponseType_Accepted = 3,
	ResponseType_Declined = 4,
	ResponseType_NotResponded = 5,
} ResponseType;
@end

