/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "CalendarGroupFetcher.h"

@implementation CalendarGroupFetcher

-(CalendarGroupOperations*) getOperations{
    return (CalendarGroupOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(CalendarCollectionFetcher*) getCalendars;
@end