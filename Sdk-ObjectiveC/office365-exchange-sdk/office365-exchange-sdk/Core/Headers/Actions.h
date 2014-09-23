









//
//  Action.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "EntityContainer.h"

#import "Folder.h"

#import "Message.h"

#import "Recipient.h"


@interface ActionFolder : NSObject

@property NSString* EntityId;
				
-(NSURLSessionDataTask*) Copy : (NSString *) DestinationId : (void (^)(Folder *folder, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Move : (NSString *) DestinationId : (void (^)(Folder *folder, NSURLResponse *response, NSError *error))callback;


@end


@interface ActionMessage : NSObject

@property NSString* EntityId;
				
-(NSURLSessionDataTask*) Copy : (NSString *) DestinationId : (void (^)(Message *message, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Move : (NSString *) DestinationId : (void (^)(Message *message, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) CreateReply : (void (^)(Message *message, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) CreateReplyAll : (void (^)(Message *message, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) CreateForward : (void (^)(Message *message, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Reply : (NSString *) Comment : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) ReplyAll : (NSString *) Comment : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Forward : (NSString *) Comment : (NSMutableArray<Recipient> *) ToRecipients : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Send : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;


@end


@interface ActionEvent : NSObject

@property NSString* EntityId;
				
-(NSURLSessionDataTask*) Accept : (NSString *) Comment : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) Decline : (NSString *) Comment : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;
				
-(NSURLSessionDataTask*) TentativelyAccept : (NSString *) Comment : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback;


@end
