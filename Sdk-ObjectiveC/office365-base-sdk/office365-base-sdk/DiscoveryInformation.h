//
//  DiscoveryInformation.h
//  office365-base-sdk
//
//  Created by Gustavo on 7/21/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "BaseEntity.h"

@interface DiscoveryInformation : BaseEntity

@property (nonatomic) NSString *ServiceName;
@property (nonatomic) NSString *ServiceResourceId;
@property (nonatomic) NSString *Capability;
@property (nonatomic) NSString *ServiceEndpointUri;

- (BaseEntity *)createFromJson:(NSDictionary *)data;

@end