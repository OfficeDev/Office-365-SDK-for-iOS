/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarFetcher.h"
#import "MSOEventCollectionFetcher.h"


/**
* The implementation file for type MSOCalendarFetcher.
*/

@implementation MSOCalendarFetcher

-(MSOCalendarOperations*) getOperations{
    return (MSOCalendarOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOCalendar class]];
}

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
   return [self.Parent oDataExecute:path :content :verb :callback];
}

-(NSURLSessionDataTask *)execute:(void (^)(MSOCalendar *mSOCalendar, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(MSOEventCollectionFetcher*) getEvents{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Events" ];
  
    return [[MSOEventCollectionFetcher alloc] initWith:path :self : [MSOEvent class]];
}

@end