/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "Metadata.h"

@implementation Metadata

- (instancetype)initWith:(NSDictionary *) data{
    
    self.Id = [data valueForKey:@"id"];
    self.Uri = [data valueForKey :@"uri"];
    self.type = [data valueForKey: @"type"];
    
    return self;
}

@end