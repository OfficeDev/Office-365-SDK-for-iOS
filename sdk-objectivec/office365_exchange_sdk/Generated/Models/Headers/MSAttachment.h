/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSEntity.h"

/**
* The header for type Attachment.
*/

@interface MSAttachment : MSEntity
@property NSString *Name;
@property NSString *ContentType;
@property int Size;
@property bool IsInline;
@property NSDate *DateTimeLastModified;
@property NSString* $$__ODataType;
@end