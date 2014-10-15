/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarGroupFetcher.h"
#import "MSOCalendarCollectionFetcher.h"


/**
* The implementation file for type MSOCalendarGroupFetcher.
*/

@implementation MSOCalendarGroupFetcher

-(MSOCalendarGroupOperations*) getOperations{
    return (MSOCalendarGroupOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOCalendarGroup class]];
}

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
   return [self.Parent oDataExecute:path :content :verb :callback];
}

-(NSURLSessionDataTask *)execute:(void (^)(MSOCalendarGroup *mSOCalendarGroup, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(MSOCalendarCollectionFetcher*) getCalendars{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Calendars" ];
  
    return [[MSOCalendarCollectionFetcher alloc] initWith:path :self : [MSOCalendar class]];
}

@end