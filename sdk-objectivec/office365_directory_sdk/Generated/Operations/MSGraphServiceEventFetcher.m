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

@implementation MSGraphServiceEventFetcher

-(MSGraphServiceEventOperations*) getOperations{
	return [[MSGraphServiceEventOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSGraphServiceEvent class]];
}

-(NSURLSessionTask*) updateEvent:(id)entity withCallback:(void (^)(MSGraphServiceEvent*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteEvent:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSGraphServiceCalendarFetcher*) getCalendar{
	 return [[MSGraphServiceCalendarFetcher alloc] initWithUrl:@"Calendar" parent:self andEntityClass: [MSGraphServiceCalendar class]];
}
-(MSGraphServiceEventCollectionFetcher*) getInstances{
    return [[MSGraphServiceEventCollectionFetcher alloc] initWithUrl:@"Instances" parent:self andEntityClass:[MSGraphServiceEvent class]];
}

-(id<MSGraphServiceEventFetcher>) getInstancesById : (NSString*)_id{
    return [[[MSGraphServiceEventCollectionFetcher alloc] initWithUrl:@"Instances" parent:self andEntityClass:[MSGraphServiceEvent class]] getById:_id];
}
-(MSGraphServiceCalendarViewFetcher*) asCalendarView{
	return [[MSGraphServiceCalendarViewFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceCalendarView class]];
}

@end