/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSAttachment.h"

/**
* The header for type FileAttachment.
*/

@interface MSFileAttachment : MSAttachment
@property NSString *ContentId;
@property NSString *ContentLocation;
@property bool IsContactPhoto;
@property Byte ContentBytes;

@end