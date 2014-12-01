/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "BaseTestRunner.h"
#import "Test.h"
#import "MSDiscoveryClient.h"

@interface DiscoveryTestRunner : BaseTestRunner

@property MSDiscoveryClient *Client;

-(id)initWithClient : (MSDiscoveryClient*)client;
@end
