//
//  ListItem.h
//  office365-lists-sdk
//
//  Created by Lagash on 8/13/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "BaseEntity.h"

@interface ListItem : BaseEntity

- (NSString*) getTitle;
- (NSUUID*) getGuid;
@end
