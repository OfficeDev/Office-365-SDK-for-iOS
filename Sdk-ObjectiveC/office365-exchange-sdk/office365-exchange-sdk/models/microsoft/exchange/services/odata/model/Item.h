//
//  Item.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"
#import "ItemBody.h"
#import "Importance.h"

@interface Item : Entity

@property NSString * ChangeKey;
@property NSString * ClassName;
@property NSString * Subject;
@property ItemBody * Body;
@property NSString * BodyPreview;
@property enum Importance * Importance;
@property NSMutableArray * Categories;
@property bool HasAttachments;
@property NSMutableArray * Attachments;

@end