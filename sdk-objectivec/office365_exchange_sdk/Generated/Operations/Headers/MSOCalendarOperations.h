/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendar.h"
#import "MSOEntityOperations.h"
#import "MSOEvent.h"

/**
* The header for type MSOCalendarOperations.
*/


@interface MSOCalendarOperations : MSOEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end