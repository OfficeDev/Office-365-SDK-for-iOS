/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSCalendar.h"
#import "MSEntityOperations.h"
#import "MSEvent.h"

/**
* The header for type MSCalendarOperations.
*/


@interface MSCalendarOperations : MSEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end