/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarFetcher.h"
#import "MSOEventCollectionFetcher.h"


/**
* The implementation file for type MSOCalendarFetcher.
*/

@implementation MSOCalendarFetcher

-(MSOCalendarOperations*) getOperations{
	return [[MSOCalendarOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOCalendar class]];
}

-(MSOEventCollectionFetcher*) getEvents{
    return [[MSOEventCollectionFetcher alloc] initWith:@"Events" :self : [MSOEvent class]];
}

@end