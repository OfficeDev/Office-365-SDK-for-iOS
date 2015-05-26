/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseTestRunner.h"
#import "Test.h"

@interface DiscoveryTestRunner : BaseTestRunner

@property (nonatomic, strong) MSDiscoveryClient *client;

-(id)initWithClient:(MSDiscoveryClient *)client;

@end
