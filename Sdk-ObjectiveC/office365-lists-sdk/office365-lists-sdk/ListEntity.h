//
//  ListEntity.h
//  office365-lists-sdk
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "office365-base-sdk/BaseEntity.h"

@interface ListEntity : BaseEntity

@property (nonatomic) NSString *Title;

- (BaseEntity *)createFromJson:(NSDictionary *)data;

@end