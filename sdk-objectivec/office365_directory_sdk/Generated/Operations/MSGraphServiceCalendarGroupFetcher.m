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

@implementation MSGraphServiceCalendarGroupFetcher

-(MSGraphServiceCalendarGroupOperations*) getOperations{
	return [[MSGraphServiceCalendarGroupOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSGraphServiceCalendarGroup class]];
}

-(NSURLSessionTask*) updateCalendarGroup:(id)entity withCallback:(void (^)(MSGraphServiceCalendarGroup*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteCalendarGroup:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSGraphServiceCalendarCollectionFetcher*) getCalendars{
    return [[MSGraphServiceCalendarCollectionFetcher alloc] initWithUrl:@"Calendars" parent:self andEntityClass:[MSGraphServiceCalendar class]];
}

-(id<MSGraphServiceCalendarFetcher>) getCalendarsById : (NSString*)_id{
    return [[[MSGraphServiceCalendarCollectionFetcher alloc] initWithUrl:@"Calendars" parent:self andEntityClass:[MSGraphServiceCalendar class]] getById:_id];
}

@end