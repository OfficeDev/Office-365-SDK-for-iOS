/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Attachment.h"


@interface FileAttachment : Attachment	

@property NSString *ContentId;
@property NSString *ContentLocation;
@property bool IsContactPhoto;
@property Byte ContentBytes;

@end