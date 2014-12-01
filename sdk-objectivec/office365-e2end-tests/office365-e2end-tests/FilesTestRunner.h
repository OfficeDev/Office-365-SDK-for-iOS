/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "BaseTestRunner.h"
#import "Test.h"
#import "MSSharePointClient.h"
@interface FilesTestRunner : BaseTestRunner
@property MSSharePointClient *Client;

-(id)initWithClient : (MSSharePointClient*)client;
@end
