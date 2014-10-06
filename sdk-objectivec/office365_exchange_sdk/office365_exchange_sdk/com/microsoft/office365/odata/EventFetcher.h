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

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(AttachmentCollectionFetcher*) getAttachments;
-(CalendarFetcher*) getCalendar;
@end