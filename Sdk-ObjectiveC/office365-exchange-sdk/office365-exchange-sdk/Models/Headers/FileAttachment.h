//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Attachment.h"



@interface FileAttachment : Attachment	


@property NSString *ContentId;

@property NSString *ContentLocation;

@property bool IsContactPhoto;

@property Byte ContentBytes;


@end