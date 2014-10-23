/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSCalendarGroup.h"
#import "MSEntityOperations.h"
#import "MSCalendar.h"

/**
* The header for type MSCalendarGroupOperations.
*/


@interface MSCalendarGroupOperations : MSEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end