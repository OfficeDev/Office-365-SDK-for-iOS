
//
//	EntityContainer.h
//
//  Copyright (c) 2014 Microsoft. 
//  All rights reserved.
//
#import <Foundation/Foundation.h>
#import "NSURLSessionDataTaskOdata.h"
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

-(NSURLSessionDataTaskOdata *)getFolders : (NSString*)path;

-(NSURLSessionDataTaskOdata*)getFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata*)deleteFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateFolder :(Folder*)folder Path : (NSString*)path Callback:(void (^)(Folder* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createMessage :(Message*)message Path : (NSString*)path Callback:(void (^)(Message* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata *)getMessages : (NSString*)path;

-(NSURLSessionDataTaskOdata*)getMessages :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata*)deleteMessages :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateMessage :(Message*)message Path : (NSString*)path Callback:(void (^)(Message* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createCalendar :(Calendar*)calendar Path : (NSString*)path Callback:(void (^)(Calendar* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata *)getCalendars : (NSString*)path;

-(NSURLSessionDataTaskOdata*)getCalendars :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata*)deleteCalendars :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateCalendar :(Calendar*)calendar Path : (NSString*)path Callback:(void (^)(Calendar* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createCalendarGroup :(CalendarGroup*)calendargroup Path : (NSString*)path Callback:(void (^)(CalendarGroup* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata *)getCalendarGroups : (NSString*)path;

-(NSURLSessionDataTaskOdata*)getCalendarGroups :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata*)deleteCalendarGroups :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateCalendarGroup :(CalendarGroup*)calendargroup Path : (NSString*)path Callback:(void (^)(CalendarGroup* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createEvent :(Event*)event Path : (NSString*)path Callback:(void (^)(Event* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata *)getEvents : (NSString*)path;

-(NSURLSessionDataTaskOdata*)getEvents :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata*)deleteEvents :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateEvent :(Event*)event Path : (NSString*)path Callback:(void (^)(Event* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createContact :(Contact*)contact Path : (NSString*)path Callback:(void (^)(Contact* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata *)getContacts : (NSString*)path;

-(NSURLSessionDataTaskOdata*)getContacts :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata*)deleteContacts :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateContact :(Contact*)contact Path : (NSString*)path Callback:(void (^)(Contact* message, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)createContactFolder :(ContactFolder*)contactfolder Path : (NSString*)path Callback:(void (^)(ContactFolder* message, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata *)getContactFolders : (NSString*)path;

-(NSURLSessionDataTaskOdata*)getContactFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

-(NSURLSessionDataTaskOdata*)deleteContactFolders :(NSString*)entityId Type : (Class) classType
                           Callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;

- (NSURLSessionDataTask *)updateContactFolder :(ContactFolder*)contactfolder Path : (NSString*)path Callback:(void (^)(ContactFolder* message, NSURLResponse *response, NSError *error))callback;

@end