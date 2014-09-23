//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Entity.h"



@class ItemBody;

@class Importance;

@class Attachment;

@interface Item : Entity	


@property NSString *ChangeKey;

@property NSString *ClassName;

@property NSString *Subject;

@property ItemBody *Body;

@property NSString *BodyPreview;

@property Importance *Importance;

@property NSMutableArray *Categories;

@property bool HasAttachments;

@property NSMutableArray<Attachment> *Attachments;


@end