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

#import "MSGraphServiceODataEntities.h"

@implementation MSGraphServiceCalendarFetcher

-(MSGraphServiceCalendarOperations*) getOperations{
	return [[MSGraphServiceCalendarOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSGraphServiceCalendar class]];
}

-(NSURLSessionTask*) updateCalendar:(id)entity withCallback:(void (^)(MSGraphServiceCalendar*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteCalendar:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSGraphServiceEventCollectionFetcher*) getCalendarView{
    return [[MSGraphServiceEventCollectionFetcher alloc] initWithUrl:@"CalendarView" parent:self andEntityClass:[MSGraphServiceEvent class]];
}

-(id<MSGraphServiceEventFetcher>) getCalendarViewById : (NSString*)_id{
    return [[[MSGraphServiceEventCollectionFetcher alloc] initWithUrl:@"CalendarView" parent:self andEntityClass:[MSGraphServiceEvent class]] getById:_id];
}
-(MSGraphServiceEventCollectionFetcher*) getEvents{
    return [[MSGraphServiceEventCollectionFetcher alloc] initWithUrl:@"Events" parent:self andEntityClass:[MSGraphServiceEvent class]];
}

-(id<MSGraphServiceEventFetcher>) getEventsById : (NSString*)_id{
    return [[[MSGraphServiceEventCollectionFetcher alloc] initWithUrl:@"Events" parent:self andEntityClass:[MSGraphServiceEvent class]] getById:_id];
}

@end