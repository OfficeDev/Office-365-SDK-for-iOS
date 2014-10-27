/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookEntity.h"

/**
* The header for type Attachment.
*/

@interface MSOutlookAttachment : MSOutlookEntity
@property NSString *Name;
@property NSString *ContentType;
@property int Size;
@property bool IsInline;
@property NSDate *DateTimeLastModified;

@end