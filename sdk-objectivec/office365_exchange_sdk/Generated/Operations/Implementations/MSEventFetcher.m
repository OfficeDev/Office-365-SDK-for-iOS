/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSEventFetcher.h"
#import "MSAttachmentCollectionFetcher.h"
#import "MSCalendarFetcher.h"
#import "MSEventCollectionFetcher.h"


/**
* The implementation file for type MSEventFetcher.
*/


@implementation MSEventFetcher
-(MSEventOperations*) getOperations{
	return [[MSEventOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSEvent class]];
}

-(MSAttachmentCollectionFetcher*) getAttachments{
    return [[MSAttachmentCollectionFetcher alloc] initWith:@"Attachments" :self : [MSAttachment class]];
}

-(MSCalendarFetcher*) getCalendar{
	 return [[MSCalendarFetcher alloc] initWith:@"Calendar" :self : [MSCalendar class]];
}

-(MSEventCollectionFetcher*) getInstances{
    return [[MSEventCollectionFetcher alloc] initWith:@"Instances" :self : [MSEvent class]];
}


@end