/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseEntity.h"

@interface DiscoveryInformation : BaseEntity

@property (nonatomic) NSString *ServiceName;
@property (nonatomic) NSString *ServiceResourceId;
@property (nonatomic) NSString *Capability;
@property (nonatomic) NSString *ServiceEndpointUri;

- (BaseEntity *)createFromJson:(NSDictionary *)data;

@end