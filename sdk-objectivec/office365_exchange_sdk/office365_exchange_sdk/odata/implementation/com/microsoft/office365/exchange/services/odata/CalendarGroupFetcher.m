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

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    
    return [super initWith:urlComponent :parent :[CalendarGroup class] :[CalendarGroupOperations class]];
}
-(CalendarCollectionFetcher*) getCalendars{
    return [[CalendarCollectionFetcher alloc] initWith:@"Calendars" :self :[Calendar class] : [CalendarCollectionOperations class]];
}
@end