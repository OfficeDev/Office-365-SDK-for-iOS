/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookCalendar.h"
#import "MSOutlookEntityOperations.h"
#import "MSOutlookEvent.h"

/**
* The header for type MSOutlookCalendarOperations.
*/


@interface MSOutlookCalendarOperations : MSOutlookEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

@end