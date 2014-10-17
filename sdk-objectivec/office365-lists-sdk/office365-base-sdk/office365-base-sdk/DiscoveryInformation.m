//
//  DiscoveryInformation.m
//  office365-base-sdk
//
//  Created by Gustavo on 7/21/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

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