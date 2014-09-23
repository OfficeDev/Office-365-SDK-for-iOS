//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Entity.h"



@interface Attachment : Entity	


@property NSString *Name;

@property NSString *ContentType;

@property int Size;

@property bool IsInline;

@property NSDate *LastModifiedTime;


@end