/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSCalendarGroupFetcher.h"
#import "MSCalendarCollectionFetcher.h"


/**
* The implementation file for type MSCalendarGroupFetcher.
*/


@implementation MSCalendarGroupFetcher
-(MSCalendarGroupOperations*) getOperations{
	return [[MSCalendarGroupOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSCalendarGroup class]];
}

-(MSCalendarCollectionFetcher*) getCalendars{
    return [[MSCalendarCollectionFetcher alloc] initWith:@"Calendars" :self : [MSCalendar class]];
}


@end