//
//	EntityContainer.h
//
//  Copyright (c) 2014 Microsoft. 
//  All rights reserved.
//
#import <Foundation/Foundation.h>
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

@end