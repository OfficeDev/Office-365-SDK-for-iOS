/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Entity.h"


@interface Item : Entity	

@property NSString *ChangeKey;
@property NSMutableArray *Categories;
@property NSDate *DateTimeCreated;
@property NSDate *DateTimeLastModified;

@end