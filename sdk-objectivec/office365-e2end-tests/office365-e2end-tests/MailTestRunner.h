//
//  ListTests.h
//  office365-e2end-tests
//
//  Created by Gustavo on 7/23/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <office365_exchange_sdk/office365_exchange_sdk-Prefix.pch>
#import "BaseTestRunner.h"
#import "TestParameters.h"
#import "Test.h"
#import "LogInController.h"
#import "BaseController.h"
#import <office365_exchange_sdk/MSOEntityContainerClient.h>
#import <office365_odata_base/MSODefaultDependencyResolver.h>
#import <office365_odata_base/MSOBasicCredentials.h>
#import <office365_odata_base/MSOCredentialsImpl.h>

@interface MailTestRunner : BaseTestRunner

@property TestParameters *Parameters;
@property MSOEntityContainerClient *Client;
-(id)initWithClient : (MSOEntityContainerClient*)client;
-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *))result;

@end