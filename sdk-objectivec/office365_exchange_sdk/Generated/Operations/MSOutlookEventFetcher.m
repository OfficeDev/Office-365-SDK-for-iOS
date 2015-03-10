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

#import "MSOutlookODataEntities.h"

@implementation MSOutlookEventFetcher

-(MSOutlookEventOperations*) getOperations{
	return [[MSOutlookEventOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOutlookEvent class]];
}

-(NSURLSessionTask*) updateEvent:(id)entity withCallback:(void (^)(MSOutlookEvent*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteEvent:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSOutlookAttachmentCollectionFetcher*) getAttachments{
    return [[MSOutlookAttachmentCollectionFetcher alloc] initWithUrl:@"Attachments" parent:self andEntityClass:[MSOutlookAttachment class]];
}

-(id<MSOutlookAttachmentFetcher>) getAttachmentsById : (NSString*)_id{
    return [[[MSOutlookAttachmentCollectionFetcher alloc] initWithUrl:@"Attachments" parent:self andEntityClass:[MSOutlookAttachment class]] getById:_id];
}
-(MSOutlookCalendarFetcher*) getCalendar{
	 return [[MSOutlookCalendarFetcher alloc] initWithUrl:@"Calendar" parent:self andEntityClass: [MSOutlookCalendar class]];
}
-(MSOutlookEventCollectionFetcher*) getInstances{
    return [[MSOutlookEventCollectionFetcher alloc] initWithUrl:@"Instances" parent:self andEntityClass:[MSOutlookEvent class]];
}

-(id<MSOutlookEventFetcher>) getInstancesById : (NSString*)_id{
    return [[[MSOutlookEventCollectionFetcher alloc] initWithUrl:@"Instances" parent:self andEntityClass:[MSOutlookEvent class]] getById:_id];
}

@end