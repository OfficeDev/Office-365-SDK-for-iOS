/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSOutlookEntity.h"

/**
* The header for type Item.
*/

@interface MSOutlookItem : MSOutlookEntity

@property (copy, nonatomic, readwrite, getter=changeKey, setter=setChangeKey:) NSString *ChangeKey;
@property (copy, nonatomic, readwrite, getter=categories, setter=setCategories:) NSMutableArray *Categories;
@property (copy, nonatomic, readwrite, getter=dateTimeCreated, setter=setDateTimeCreated:) NSDate *DateTimeCreated;
@property (copy, nonatomic, readwrite, getter=dateTimeLastModified, setter=setDateTimeLastModified:) NSDate *DateTimeLastModified;

@end