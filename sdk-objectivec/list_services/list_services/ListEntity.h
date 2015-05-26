/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseEntity.h"

@interface ListEntity : BaseEntity
@property NSString *title;
// @property NSString *description;

-(NSString *) getTitle;

@end
