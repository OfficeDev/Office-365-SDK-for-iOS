//
//  FreeBusyStatus.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface NSObject ()

typedef enum {
	FreeBusyStatus_Unknown = 0,
	FreeBusyStatus_Free = 1,
	FreeBusyStatus_Tentative = 2,
	FreeBusyStatus_Busy = 3,
	FreeBusyStatus_Oof = 4,
	FreeBusyStatus_WorkingElsewhere = 5,
} FreeBusyStatus;
@end

