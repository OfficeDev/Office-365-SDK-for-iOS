/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@interface NSObject ()

typedef enum {
	SingleInstance,
	Occurrence,
	Exception,
	SeriesMaster
} MSOutlookEventType;

@end