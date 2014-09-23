//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface NSObject ()

typedef enum {

	None,

	Organizer,

	TentativelyAccepted,

	Accepted,

	Declined,

	NotResponded

} ResponseType;

@end