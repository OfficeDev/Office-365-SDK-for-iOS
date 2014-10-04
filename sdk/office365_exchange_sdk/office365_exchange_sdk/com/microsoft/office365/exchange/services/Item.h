//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Entity.h"

@interface Item : Entity	

@property NSString *ChangeKey;
@property NSMutableArray *Categories;
@property NSDate *DateTimeCreated;
@property NSDate *DateTimeLastModified;

@end