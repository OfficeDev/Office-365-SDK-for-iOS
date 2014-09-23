







//
//  Protocols.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//
#import <Foundation/Foundation.h>

@class Folder;

@class Message;

@class Recipient;


@protocol BodyType
@end


@protocol Importance
@end


@protocol AttendeeType
@end


@protocol ResponseType
@end


@protocol EventType
@end


@protocol FreeBusyStatus
@end


@protocol MeetingMessageType
@end


@protocol RecurrencePatternType
@end


@protocol RecurrenceRangeType
@end


@protocol WeekIndex
@end


@protocol DayOfWeek
@end


@protocol Recipient
@end


@protocol Attendee
@end


@protocol ItemBody
@end


@protocol Location
@end


@protocol ResponseStatus
@end


@protocol RecurrencePattern
@end


@protocol RecurrenceRange
@end


@protocol PatternedRecurrence
@end


@protocol Entity


@end


@protocol User


@end


@protocol Folder
				
-(NSURLSessionDataTask*) Copy : (NSString *) DestinationId :  (void (^)(Folder *folder, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Move : (NSString *) DestinationId :  (void (^)(Folder *folder, NSURLResponse *response, NSError *error))callback;


@end


@protocol Item


@end


@protocol Message
				
-(NSURLSessionDataTask*) Copy : (NSString *) DestinationId :  (void (^)(Message *message, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Move : (NSString *) DestinationId :  (void (^)(Message *message, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) CreateReply :  (void (^)(Message *message, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) CreateReplyAll :  (void (^)(Message *message, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) CreateForward :  (void (^)(Message *message, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Reply : (NSString *) Comment :  (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) ReplyAll : (NSString *) Comment :  (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Forward : (NSString *) Comment : (NSMutableArray<Recipient> *) ToRecipients :  (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Send :  (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;


@end


@protocol Attachment


@end


@protocol FileAttachment


@end


@protocol ItemAttachment


@end


@protocol Calendar


@end


@protocol CalendarGroup


@end


@protocol Event
				
-(NSURLSessionDataTask*) Accept : (NSString *) Comment :  (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Decline : (NSString *) Comment :  (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) TentativelyAccept : (NSString *) Comment :  (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;


@end


@protocol Contact


@end


@protocol ContactFolder


@end
