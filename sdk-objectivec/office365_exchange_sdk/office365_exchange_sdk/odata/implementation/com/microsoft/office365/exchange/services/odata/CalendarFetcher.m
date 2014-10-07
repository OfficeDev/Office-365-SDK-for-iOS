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

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    
    return [super initWith:urlComponent :parent :[Calendar class] :[CalendarOperations class]];
}
-(EventCollectionFetcher*) getEvents{
    return [[EventCollectionFetcher alloc] initWith:@"Events" :self :[Event class] : [EventCollectionOperations class]];
}
@end