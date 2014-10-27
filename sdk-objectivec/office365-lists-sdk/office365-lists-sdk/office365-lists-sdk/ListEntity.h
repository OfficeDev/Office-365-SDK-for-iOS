//
//  ListEntity.h
//  office365-lists-sdk
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "BaseEntity.h"

@interface ListEntity : BaseEntity
@property NSString *title;
@property NSString *description;

-(NSString *) getTitle;

@end