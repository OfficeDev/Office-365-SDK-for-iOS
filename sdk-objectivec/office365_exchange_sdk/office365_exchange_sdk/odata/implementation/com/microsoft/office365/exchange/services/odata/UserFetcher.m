/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "UserFetcher.h"
#import "MessageCollectionOperations.h"
#import "FolderCollectionOperations.h"
@implementation UserFetcher

@synthesize UrlComponent;
@synthesize Parent;

-(UserOperations*) getOperations{
    return (UserOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [User class] :[UserOperations class]];
}

-(FolderCollectionFetcher*) getFolders{
    NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Folders" ];
    return[[FolderCollectionFetcher alloc] initWith:path :self];
}


-(MessageCollectionFetcher*) getMessages{
    NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Messages" ];
    
    return [[MessageCollectionFetcher alloc] initWith:path :self];
}

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
   return [self.Parent oDataExecute:path :content :verb :callback];
}

-(NSURLSessionDataTask *)execute:(void (^)(User *user, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(FolderFetcher *)getRootFolder{
    return [[FolderFetcher alloc] initWith:@"RootFolder" :self];
}
/*
-(FolderFetcher) getRootFolder{

    return [[FolderFetcher alloc] initWith:@"RootFolder" :self :[super.class classForClassName:@"Folder"] : [FolderrOperations class]];
}
-(CalendarCollectionFetcher*) getCalendars{
    return [[CalendarCollectionFetcher alloc] initWith:@"Calendars" :self :[super.class classForClassName:@"Calendar"]  : [CalendarCollectionOperations class]];
}
-(CalendarFetcher) getCalendar{

    return [[CalendarFetcher alloc] initWith:@"Calendar" :self :[super.class classForClassName:@"Calendar"] : [CalendarrOperations class]];
}
-(CalendarGroupCollectionFetcher*) getCalendarGroups{
    return [[CalendarGroupCollectionFetcher alloc] initWith:@"CalendarGroups" :self :[super.class classForClassName:@"CalendarGroup"]  : [CalendarGroupCollectionOperations class]];
}
-(EventCollectionFetcher*) getEvents{
    return [[EventCollectionFetcher alloc] initWith:@"Events" :self :[super.class classForClassName:@"Event"]  : [EventCollectionOperations class]];
}
-(ContactCollectionFetcher*) getContacts{
    return [[ContactCollectionFetcher alloc] initWith:@"Contacts" :self :[super.class classForClassName:@"Contact"]  : [ContactCollectionOperations class]];
}
-(ContactFolderCollectionFetcher*) getContactFolders{
    return [[ContactFolderCollectionFetcher alloc] initWith:@"ContactFolders" :self :[super.class classForClassName:@"ContactFolder"]  : [ContactFolderCollectionOperations class]];
}*/
@end