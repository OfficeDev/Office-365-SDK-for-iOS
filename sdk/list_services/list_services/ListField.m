/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ListField.h"

@implementation ListField : BaseEntity
- (NSString*) getTitle{
    return (NSString*)[self getData : @"Title"];
}

- (NSString*) getPropertyName{
    return (NSString*)[self getData : @"Title"];
}
@end
