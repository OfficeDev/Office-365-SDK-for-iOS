/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOUserFetcher.h"
#import "MSOFolderCollectionFetcher.h"
#import "MSOMessageCollectionFetcher.h"
#import "MSOFolderFetcher.h"
#import "MSOCalendarCollectionFetcher.h"
#import "MSOCalendarFetcher.h"
#import "MSOCalendarGroupCollectionFetcher.h"
#import "MSOEventCollectionFetcher.h"
#import "MSOContactCollectionFetcher.h"
#import "MSOContactFolderCollectionFetcher.h"


/**
* The implementation file for type MSOUserFetcher.
*/

@implementation MSOUserFetcher

-(MSOUserOperations*) getOperations{
    return (MSOUserOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOUser class]];
}

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
   return [self.Parent oDataExecute:path :content :verb :callback];
}

-(NSURLSessionDataTask *)execute:(void (^)(MSOUser *mSOUser, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(MSOFolderCollectionFetcher*) getFolders{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Folders" ];
  
    return [[MSOFolderCollectionFetcher alloc] initWith:path :self : [MSOFolder class]];
}

-(MSOMessageCollectionFetcher*) getMessages{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Messages" ];
  
    return [[MSOMessageCollectionFetcher alloc] initWith:path :self : [MSOMessage class]];
}

-(MSOFolderFetcher*) getRootFolder{
	 return [[MSOFolderFetcher alloc] initWith:@"RootFolder" :self : [MSOFolder class]];
}

-(MSOCalendarCollectionFetcher*) getCalendars{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Calendars" ];
  
    return [[MSOCalendarCollectionFetcher alloc] initWith:path :self : [MSOCalendar class]];
}

-(MSOCalendarFetcher*) getCalendar{
	 return [[MSOCalendarFetcher alloc] initWith:@"Calendar" :self : [MSOCalendar class]];
}

-(MSOCalendarGroupCollectionFetcher*) getCalendarGroups{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"CalendarGroups" ];
  
    return [[MSOCalendarGroupCollectionFetcher alloc] initWith:path :self : [MSOCalendarGroup class]];
}

-(MSOEventCollectionFetcher*) getEvents{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Events" ];
  
    return [[MSOEventCollectionFetcher alloc] initWith:path :self : [MSOEvent class]];
}

-(MSOContactCollectionFetcher*) getContacts{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Contacts" ];
  
    return [[MSOContactCollectionFetcher alloc] initWith:path :self : [MSOContact class]];
}

-(MSOContactFolderCollectionFetcher*) getContactFolders{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"ContactFolders" ];
  
    return [[MSOContactFolderCollectionFetcher alloc] initWith:path :self : [MSOContactFolder class]];
}

@end