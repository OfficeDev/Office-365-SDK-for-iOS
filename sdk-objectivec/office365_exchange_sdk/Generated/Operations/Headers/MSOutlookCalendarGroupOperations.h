/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookCalendarGroup.h"
#import "MSOutlookEntityOperations.h"
#import "MSOutlookCalendar.h"

/**
* The header for type MSOutlookCalendarGroupOperations.
*/


@interface MSOutlookCalendarGroupOperations : MSOutlookEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

@end