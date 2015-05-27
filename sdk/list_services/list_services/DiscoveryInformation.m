/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "DiscoveryInformation.h"

@implementation DiscoveryInformation

- (BaseEntity *)createFromJson:(NSDictionary *)data{
    self.Capability = [data valueForKey:@"Capability"];
    self.ServiceName = [data valueForKey:@"ServiceName"];
    self.ServiceEndpointUri = [data valueForKey:@"ServiceEndpointUri"];
    self.ServiceResourceId = [data valueForKey:@"ServiceResourceId"];
    //dinformation.Id = diccionary.valueForKey("id") as String;
    
    return self;
}

@end