/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ListItem.h"

@implementation ListItem

- (NSString*) getTitle{
    return (NSString*)[self getData : @"Title"];
}

-(NSUUID*) getGuid{
    return (NSUUID*)[self getData: @"GUID"];
}

@end
