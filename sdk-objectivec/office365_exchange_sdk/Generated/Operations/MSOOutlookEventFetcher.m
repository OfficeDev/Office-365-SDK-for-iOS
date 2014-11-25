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

#import "MSOOutlookEventFetcher.h"
#import "MSOOutlookAttachmentCollectionFetcher.h"
#import "MSOOutlookCalendarFetcher.h"
#import "MSOOutlookEventCollectionFetcher.h"


/**
* The implementation file for type MSOOutlookEventFetcher.
*/


@implementation MSOOutlookEventFetcher

-(MSOOutlookEventOperations*) getOperations{
	return [[MSOOutlookEventOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOOutlookEvent class]];
}


-(MSOOutlookAttachmentCollectionFetcher*) getAttachments{
    return [[MSOOutlookAttachmentCollectionFetcher alloc] initWithUrl:@"Attachments" parent:self andEntityClass:[MSOOutlookAttachment class]];
}


-(MSOOutlookCalendarFetcher*) getCalendar{
	 return [[MSOOutlookCalendarFetcher alloc] initWithUrl:@"Calendar" parent:self andEntityClass: [MSOOutlookCalendar class]];
}


-(MSOOutlookEventCollectionFetcher*) getInstances{
    return [[MSOOutlookEventCollectionFetcher alloc] initWithUrl:@"Instances" parent:self andEntityClass:[MSOOutlookEvent class]];
}


@end