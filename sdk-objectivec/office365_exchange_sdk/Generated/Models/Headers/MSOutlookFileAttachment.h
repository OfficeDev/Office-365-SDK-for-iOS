/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookAttachment.h"

/**
* The header for type FileAttachment.
*/

@interface MSOutlookFileAttachment : MSOutlookAttachment
@property NSString *ContentId;
@property NSString *ContentLocation;
@property bool IsContactPhoto;
@property NSData *ContentBytes;

@end