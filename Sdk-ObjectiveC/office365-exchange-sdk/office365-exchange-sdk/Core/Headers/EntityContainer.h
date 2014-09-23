
//
//	EntityContainer.h
//
//  Copyright (c) 2014 Microsoft. 
//  All rights reserved.
//
#import <Foundation/Foundation.h>
#import "NSURLSessionDataODataTask.h"
#import "BaseClient.h"
#import "JsonParser.h"


@class BodyType;

@class Importance;

@class AttendeeType;

@class ResponseType;

@class EventType;

@class FreeBusyStatus;

@class MeetingMessageType;

@class RecurrencePatternType;

@class RecurrenceRangeType;

@class WeekIndex;

@class DayOfWeek;

@class Recipient;

@class Attendee;

@class ItemBody;

@class Location;

@class ResponseStatus;

@class RecurrencePattern;

@class RecurrenceRange;

@class PatternedRecurrence;

@class Entity;

@class User;

@class Folder;

@class Item;

@class Message;

@class Attachment;

@class FileAttachment;

@class ItemAttachment;

@class Calendar;

@class CalendarGroup;

@class Event;

@class Contact;

@class ContactFolder;

@interface EntityContainer : BaseClient

+(id)initializeEntityContainer:(NSString *)url credentials:(Credentials *)credentials;

+(id)getEntityContainer;

- (NSURLSessionDataTask *)executeForPath :(NSString*)path Method:(NSString*)method Body:(NSData *)body Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;


- (NSURLSessionDataTask *)createFolder :(Folder*)folder Path : (NSString*)path Callback:(void (^)(Folder* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask *)getFolders : (NSString*)path;

-(NSURLSessionDataODataTask*)getFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask*)deleteFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateFolder :(Folder*)folder Path : (NSString*)path Callback:(void (^)(Folder* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createMessage :(Message*)message Path : (NSString*)path Callback:(void (^)(Message* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask *)getMessages : (NSString*)path;

-(NSURLSessionDataODataTask*)getMessages :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask*)deleteMessages :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateMessage :(Message*)message Path : (NSString*)path Callback:(void (^)(Message* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createCalendar :(Calendar*)calendar Path : (NSString*)path Callback:(void (^)(Calendar* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask *)getCalendars : (NSString*)path;

-(NSURLSessionDataODataTask*)getCalendars :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask*)deleteCalendars :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateCalendar :(Calendar*)calendar Path : (NSString*)path Callback:(void (^)(Calendar* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createCalendarGroup :(CalendarGroup*)calendargroup Path : (NSString*)path Callback:(void (^)(CalendarGroup* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask *)getCalendarGroups : (NSString*)path;

-(NSURLSessionDataODataTask*)getCalendarGroups :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask*)deleteCalendarGroups :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateCalendarGroup :(CalendarGroup*)calendargroup Path : (NSString*)path Callback:(void (^)(CalendarGroup* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createEvent :(Event*)event Path : (NSString*)path Callback:(void (^)(Event* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask *)getEvents : (NSString*)path;

-(NSURLSessionDataODataTask*)getEvents :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask*)deleteEvents :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateEvent :(Event*)event Path : (NSString*)path Callback:(void (^)(Event* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createContact :(Contact*)contact Path : (NSString*)path Callback:(void (^)(Contact* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask *)getContacts : (NSString*)path;

-(NSURLSessionDataODataTask*)getContacts :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask*)deleteContacts :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateContact :(Contact*)contact Path : (NSString*)path Callback:(void (^)(Contact* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createContactFolder :(ContactFolder*)contactfolder Path : (NSString*)path Callback:(void (^)(ContactFolder* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask *)getContactFolders : (NSString*)path;

-(NSURLSessionDataODataTask*)getContactFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataODataTask*)deleteContactFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateContactFolder :(ContactFolder*)contactfolder Path : (NSString*)path Callback:(void (^)(ContactFolder* message, NSURLResponse *response, NSError *error))callback;

@end