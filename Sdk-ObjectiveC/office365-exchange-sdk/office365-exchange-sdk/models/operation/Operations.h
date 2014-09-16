//
//  Operations.m
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>

@class Folder;
@class Message;
@interface Operations : NSObject

-(Folder*)Copy :(NSString*) destinationid;
-(Folder*)Move :(NSString*) destinationid;
-(Message*)Copy :(NSString*) destinationid;
-(Message*)Move :(NSString*) destinationid;
-(Message*)CreateReply;
-(Message*)CreateReplyAll;
-(Message*)CreateForward;
-(int)Reply :(NSString*) comment;
-(int)ReplyAll :(NSString*) comment;
-(int)Forward :(NSString*) comment :(NSMutableArray<Recipient>*) torecipients;
-(int)Send;
-(int)Accept :(NSString*) comment;
-(int)Decline :(NSString*) comment;
-(int)TentativelyAccept :(NSString*) comment;
@end

