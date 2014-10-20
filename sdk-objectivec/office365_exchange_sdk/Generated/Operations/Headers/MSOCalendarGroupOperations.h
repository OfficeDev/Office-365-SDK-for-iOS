/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarGroup.h"
#import "MSOODataOperations.h"
#import "MSOCalendar.h"


/**
* The header for type MSOCalendarGroupOperations.
*/

@interface MSOCalendarGroupOperations : MSOODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end