/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Entity.h"


@interface Attachment : Entity	

@property NSString *Name;
@property NSString *ContentType;
@property int Size;
@property bool IsInline;
@property NSDate *DateTimeLastModified;

@end