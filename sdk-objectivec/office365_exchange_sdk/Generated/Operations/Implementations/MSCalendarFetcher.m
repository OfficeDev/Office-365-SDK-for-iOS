/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSCalendarFetcher.h"
#import "MSEventCollectionFetcher.h"
#import "MSEventCollectionFetcher.h"


/**
* The implementation file for type MSCalendarFetcher.
*/


@implementation MSCalendarFetcher
-(MSCalendarOperations*) getOperations{
	return [[MSCalendarOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSCalendar class]];
}

-(MSEventCollectionFetcher*) getCalendarView{
    return [[MSEventCollectionFetcher alloc] initWith:@"CalendarView" :self : [MSEvent class]];
}

-(MSEventCollectionFetcher*) getEvents{
    return [[MSEventCollectionFetcher alloc] initWith:@"Events" :self : [MSEvent class]];
}


@end