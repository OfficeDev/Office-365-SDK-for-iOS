/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSOEntity.h"

/**
* The header for type Item.
*/

@interface MSOItem : MSOEntity
@property NSString *ChangeKey;
@property NSMutableArray *Categories;
@property NSDate *DateTimeCreated;
@property NSDate *DateTimeLastModified;

@end