/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEventFetcher.h"
#import "MSOAttachmentCollectionFetcher.h"
#import "MSOCalendarFetcher.h"


@implementation MSOEventFetcher

-(MSOEventOperations*) getOperations{
    return (MSOEventOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOEvent class]];
}

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
   return [self.Parent oDataExecute:path :content :verb :callback];
}

-(NSURLSessionDataTask *)execute:(void (^)(MSOEvent *mSOEvent, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(MSOAttachmentCollectionFetcher*) getAttachments{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Attachments" ];
  
    return [[MSOAttachmentCollectionFetcher alloc] initWith:path :self : [MSOAttachment class]];
}

-(MSOCalendarFetcher*) getCalendar{
	 return [[MSOCalendarFetcher alloc] initWith:@"Calendar" :self : [MSOCalendar class]];
}

@end