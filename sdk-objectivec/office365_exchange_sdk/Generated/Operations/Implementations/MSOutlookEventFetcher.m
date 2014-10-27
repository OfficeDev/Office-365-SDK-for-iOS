/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

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

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
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