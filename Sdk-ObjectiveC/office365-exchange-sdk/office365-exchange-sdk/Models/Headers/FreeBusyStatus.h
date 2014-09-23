//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface NSObject ()

typedef enum {

	Unknown,

	Free,

	Tentative,

	Busy,

	Oof,

	WorkingElsewhere

} FreeBusyStatus;

@end