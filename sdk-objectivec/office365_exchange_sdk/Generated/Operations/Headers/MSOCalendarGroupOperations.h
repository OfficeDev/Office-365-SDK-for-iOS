/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarGroup.h"
#import "MSOEntityOperations.h"
#import "MSOCalendar.h"

/**
* The header for type MSOCalendarGroupOperations.
*/


@interface MSOCalendarGroupOperations : MSOEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end