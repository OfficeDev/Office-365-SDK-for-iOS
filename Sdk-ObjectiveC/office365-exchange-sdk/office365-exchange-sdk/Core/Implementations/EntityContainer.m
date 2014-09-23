
//
//	EntityContainer.m
//
//  Created by Gustavo on 8/25/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "EntityContainer.h"
#import "HttpConnection.h"

#import "Folder.h"

#import "Message.h"

#import "Calendar.h"

#import "CalendarGroup.h"

#import "Event.h"

#import "Contact.h"

#import "ContactFolder.h"


@implementation EntityContainer

@synthesize Credential;
@synthesize Url;

static EntityContainer *entityContainer;

+(id)initializeEntityContainer:(NSString *)url credentials:(Credentials *)credentials{
    entityContainer = nil;
    
    @synchronized(self) {
        if (entityContainer == nil)
            entityContainer = [[self alloc] initWithUrl:url credentials:credentials];
    }
    
    return entityContainer;
}

+(id)getEntityContainer{
    @synchronized(self) {
    }
    
    return entityContainer;
}

- (NSURLSessionDataTask *)executeForPath :(NSString*)path Method:(NSString*)method Body:(NSData *)body Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
    //NSString *url =  [NSString stringWithFormat:@"%@%@", self.Url ,path];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:path
                                                                   bodyArray:body];
    
    return [connection execute:method callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        callback(data, reponse,error);
    }];
}


- (NSURLSessionDataTask *)createFolder :(Folder*)folder Path : (NSString*)path Callback:(void (^)(Folder* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Folders"];
    }else{
       [url appendFormat:@"//%@//Folders", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:folder];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"POST" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        Folder* result = [[Folder alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

-(NSURLSessionODataTask *)getFolders : (NSString*)path {
   
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Folders"];
    }else{
       [url appendFormat:@"//%@//Folders", path];
    }

    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = [Folder class];
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)getFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//Folders('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)deleteFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//Folders('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"DELETE";
    
    return task;
}

- (NSURLSessionDataTask *)updateFolder :(Folder*)folder Path : (NSString*)path Callback:(void (^)(Folder* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Folders"];
    }else{
       [url appendFormat:@"//%@//Folders", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:folder];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"PATCH" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        Folder* result = [[Folder alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

- (NSURLSessionDataTask *)createMessage :(Message*)message Path : (NSString*)path Callback:(void (^)(Message* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Messages"];
    }else{
       [url appendFormat:@"//%@//Messages", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:message];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"POST" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        Message* result = [[Message alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

-(NSURLSessionODataTask *)getMessages : (NSString*)path {
   
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Messages"];
    }else{
       [url appendFormat:@"//%@//Messages", path];
    }

    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = [Message class];
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)getMessages :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//Messages('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)deleteMessages :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//Messages('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"DELETE";
    
    return task;
}

- (NSURLSessionDataTask *)updateMessage :(Message*)message Path : (NSString*)path Callback:(void (^)(Message* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Messages"];
    }else{
       [url appendFormat:@"//%@//Messages", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:message];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"PATCH" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        Message* result = [[Message alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

- (NSURLSessionDataTask *)createCalendar :(Calendar*)calendar Path : (NSString*)path Callback:(void (^)(Calendar* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Calendars"];
    }else{
       [url appendFormat:@"//%@//Calendars", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:calendar];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"POST" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        Calendar* result = [[Calendar alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

-(NSURLSessionODataTask *)getCalendars : (NSString*)path {
   
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Calendars"];
    }else{
       [url appendFormat:@"//%@//Calendars", path];
    }

    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = [Calendar class];
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)getCalendars :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//Calendars('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)deleteCalendars :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//Calendars('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"DELETE";
    
    return task;
}

- (NSURLSessionDataTask *)updateCalendar :(Calendar*)calendar Path : (NSString*)path Callback:(void (^)(Calendar* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Calendars"];
    }else{
       [url appendFormat:@"//%@//Calendars", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:calendar];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"PATCH" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        Calendar* result = [[Calendar alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

- (NSURLSessionDataTask *)createCalendarGroup :(CalendarGroup*)calendargroup Path : (NSString*)path Callback:(void (^)(CalendarGroup* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//CalendarGroups"];
    }else{
       [url appendFormat:@"//%@//CalendarGroups", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:calendargroup];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"POST" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        CalendarGroup* result = [[CalendarGroup alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

-(NSURLSessionODataTask *)getCalendarGroups : (NSString*)path {
   
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//CalendarGroups"];
    }else{
       [url appendFormat:@"//%@//CalendarGroups", path];
    }

    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = [CalendarGroup class];
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)getCalendarGroups :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//CalendarGroups('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)deleteCalendarGroups :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//CalendarGroups('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"DELETE";
    
    return task;
}

- (NSURLSessionDataTask *)updateCalendarGroup :(CalendarGroup*)calendargroup Path : (NSString*)path Callback:(void (^)(CalendarGroup* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//CalendarGroups"];
    }else{
       [url appendFormat:@"//%@//CalendarGroups", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:calendargroup];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"PATCH" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        CalendarGroup* result = [[CalendarGroup alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

- (NSURLSessionDataTask *)createEvent :(Event*)event Path : (NSString*)path Callback:(void (^)(Event* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Events"];
    }else{
       [url appendFormat:@"//%@//Events", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:event];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"POST" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        Event* result = [[Event alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

-(NSURLSessionODataTask *)getEvents : (NSString*)path {
   
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Events"];
    }else{
       [url appendFormat:@"//%@//Events", path];
    }

    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = [Event class];
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)getEvents :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//Events('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)deleteEvents :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//Events('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"DELETE";
    
    return task;
}

- (NSURLSessionDataTask *)updateEvent :(Event*)event Path : (NSString*)path Callback:(void (^)(Event* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Events"];
    }else{
       [url appendFormat:@"//%@//Events", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:event];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"PATCH" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        Event* result = [[Event alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

- (NSURLSessionDataTask *)createContact :(Contact*)contact Path : (NSString*)path Callback:(void (^)(Contact* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Contacts"];
    }else{
       [url appendFormat:@"//%@//Contacts", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:contact];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"POST" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        Contact* result = [[Contact alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

-(NSURLSessionODataTask *)getContacts : (NSString*)path {
   
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Contacts"];
    }else{
       [url appendFormat:@"//%@//Contacts", path];
    }

    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = [Contact class];
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)getContacts :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//Contacts('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)deleteContacts :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//Contacts('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"DELETE";
    
    return task;
}

- (NSURLSessionDataTask *)updateContact :(Contact*)contact Path : (NSString*)path Callback:(void (^)(Contact* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//Contacts"];
    }else{
       [url appendFormat:@"//%@//Contacts", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:contact];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"PATCH" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        Contact* result = [[Contact alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

- (NSURLSessionDataTask *)createContactFolder :(ContactFolder*)contactfolder Path : (NSString*)path Callback:(void (^)(ContactFolder* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//ContactFolders"];
    }else{
       [url appendFormat:@"//%@//ContactFolders", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:contactfolder];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"POST" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        ContactFolder* result = [[ContactFolder alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

-(NSURLSessionODataTask *)getContactFolders : (NSString*)path {
   
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//ContactFolders"];
    }else{
       [url appendFormat:@"//%@//ContactFolders", path];
    }

    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = [ContactFolder class];
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)getContactFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//ContactFolders('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"GET";
    
    return task;
}

-(NSURLSessionODataTask*)deleteContactFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
	NSString *url = [NSString stringWithFormat:@"%@//Me//ContactFolders('%@')", self.Url, entityId];
    
	NSString *name = NSStringFromClass (classType);
    
    NSURLSessionODataTask * task = [[NSURLSessionODataTask alloc]initWithUrl:url credentials:self.Credential];
    task.ClassType = classType;
    task.method = @"DELETE";
    
    return task;
}

- (NSURLSessionDataTask *)updateContactFolder :(ContactFolder*)contactfolder Path : (NSString*)path Callback:(void (^)(ContactFolder* message, NSURLResponse *response, NSError *error))callback{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@//Me", self.Url];
    if(path == nil){
        [url appendString:@"//ContactFolders"];
    }else{
       [url appendFormat:@"//%@//ContactFolders", path];
    }
       
    JsonParser *parser = [[JsonParser alloc] init];
    
    NSString* jsonString = [parser toJsonString:contactfolder];
    
    NSData *body = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    return [connection execute:@"PATCH" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        ContactFolder* result = [[ContactFolder alloc] init];
        result = [parser parseWithData:data forType:[result class] selector:nil];
        
        callback(result, reponse,error);
    }];
}

@end