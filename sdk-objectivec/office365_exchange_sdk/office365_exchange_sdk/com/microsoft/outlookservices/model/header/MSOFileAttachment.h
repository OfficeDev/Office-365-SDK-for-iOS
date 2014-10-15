/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSOAttachment.h"

/**
* The header for type FileAttachment.
*/

@interface MSOFileAttachment : MSOAttachment
@property NSString *ContentId;
@property NSString *ContentLocation;
@property bool IsContactPhoto;
@property Byte ContentBytes;

@end