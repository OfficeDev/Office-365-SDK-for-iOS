/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "CalendarFetcher.h"

@implementation CalendarFetcher

-(CalendarOperations*) getOperations{
    return (CalendarOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(EventCollectionFetcher*) getEvents;
@end