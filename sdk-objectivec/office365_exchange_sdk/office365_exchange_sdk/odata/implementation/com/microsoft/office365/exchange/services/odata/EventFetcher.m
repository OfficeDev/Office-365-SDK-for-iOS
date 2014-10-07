/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "EventFetcher.h"

@implementation EventFetcher

-(EventOperations*) getOperations{
    return (EventOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    
    return [super initWith:urlComponent :parent :[Event class] :[EventOperations class]];
}
-(AttachmentCollectionFetcher*) getAttachments{
    return [[AttachmentCollectionFetcher alloc] initWith:@"Attachments" :self :[Attachment class] : [AttachmentCollectionOperations class]];
}
-(CalendarFetcher) getCalendar{

    return [[CalendarFetcher alloc] initWith:@"Calendar" :self :[Calendar class] : [CalendarrOperations class]];
}
@end