//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface NSObject ()

typedef enum {

	SingleInstance,

	Occurrence,

	Exception,

	SeriesMaster

} EventType;

@end