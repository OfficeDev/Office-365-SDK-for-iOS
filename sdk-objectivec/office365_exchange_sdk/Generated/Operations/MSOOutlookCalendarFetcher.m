/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOOutlookCalendarFetcher.h"
#import "MSOOutlookEventCollectionFetcher.h"
#import "MSOOutlookEventCollectionFetcher.h"


/**
* The implementation file for type MSOOutlookCalendarFetcher.
*/


@implementation MSOOutlookCalendarFetcher

-(MSOOutlookCalendarOperations*) getOperations{
	return [[MSOOutlookCalendarOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOOutlookCalendar class]];
}


-(MSOOutlookEventCollectionFetcher*) getCalendarView{
    return [[MSOOutlookEventCollectionFetcher alloc] initWithUrl:@"CalendarView" parent:self andEntityClass:[MSOOutlookEvent class]];
}


-(MSOOutlookEventCollectionFetcher*) getEvents{
    return [[MSOOutlookEventCollectionFetcher alloc] initWithUrl:@"Events" parent:self andEntityClass:[MSOOutlookEvent class]];
}


@end