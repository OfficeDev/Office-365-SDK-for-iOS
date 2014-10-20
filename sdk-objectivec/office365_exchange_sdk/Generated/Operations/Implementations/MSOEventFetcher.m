/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEventFetcher.h"
#import "MSOAttachmentCollectionFetcher.h"
#import "MSOCalendarFetcher.h"


/**
* The implementation file for type MSOEventFetcher.
*/

@implementation MSOEventFetcher

-(MSOEventOperations*) getOperations{
	return [[MSOEventOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOEvent class]];
}

-(MSOAttachmentCollectionFetcher*) getAttachments{
    return [[MSOAttachmentCollectionFetcher alloc] initWith:@"Attachments" :self : [MSOAttachment class]];
}

-(MSOCalendarFetcher*) getCalendar{
	 return [[MSOCalendarFetcher alloc] initWith:@"Calendar" :self : [MSOCalendar class]];
}

@end