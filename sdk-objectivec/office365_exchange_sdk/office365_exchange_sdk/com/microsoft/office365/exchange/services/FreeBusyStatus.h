//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface NSObject ()

typedef enum {
	Free,
	Tentative,
	Busy,
	Oof,
	WorkingElsewhere,
	Unknown
} FreeBusyStatus;

@end