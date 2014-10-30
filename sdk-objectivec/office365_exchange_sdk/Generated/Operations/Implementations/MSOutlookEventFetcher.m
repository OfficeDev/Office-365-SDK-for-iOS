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

#import "MSOutlookEventFetcher.h"
#import "MSOutlookAttachmentCollectionFetcher.h"
#import "MSOutlookCalendarFetcher.h"
#import "MSOutlookEventCollectionFetcher.h"


/**
* The implementation file for type MSOutlookEventFetcher.
*/


@implementation MSOutlookEventFetcher
-(MSOutlookEventOperations*) getOperations{
	return [[MSOutlookEventOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookEvent class]];
}

-(MSOutlookAttachmentCollectionFetcher*) getAttachments{
    return [[MSOutlookAttachmentCollectionFetcher alloc] initWith:@"Attachments" :self : [MSOutlookAttachment class]];
}

-(MSOutlookCalendarFetcher*) getCalendar{
	 return [[MSOutlookCalendarFetcher alloc] initWith:@"Calendar" :self : [MSOutlookCalendar class]];
}

-(MSOutlookEventCollectionFetcher*) getInstances{
    return [[MSOutlookEventCollectionFetcher alloc] initWith:@"Instances" :self : [MSOutlookEvent class]];
}


@end