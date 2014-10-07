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
    
    return [super initWith:urlComponent :parent :[super.class classForClassName:@"Event"] :[EventOperations class]];
}
-(AttachmentCollectionFetcher*) getAttachments{
    return nil;//[[AttachmentCollectionFetcher alloc] initWith:@"Attachments" :self :[super.class classForClassName:@"Attachment"]  : [AttachmentCollectionOperations class]];
}
-(CalendarFetcher*) getCalendar{

    return nil;//[[CalendarFetcher alloc] initWith:@"Calendar" :self :[super.class classForClassName:@"Calendar"] : [CalendarrOperations class]];
}
@end