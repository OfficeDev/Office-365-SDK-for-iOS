/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookEntity.h"

/**
* The header for type Item.
*/

@interface MSOutlookItem : MSOutlookEntity
@property NSString *ChangeKey;
@property NSMutableArray *Categories;
@property NSDate *DateTimeCreated;
@property NSDate *DateTimeLastModified;

@end