/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseTestRunner.h"
#import "TestParameters.h"
#import "Test.h"
#import "LogInController.h"
#import "BaseController.h"
#import <office365_exchange_sdk/MSOutlookClient.h>
#import <office365_odata_base/MSDefaultDependencyResolver.h>
#import <office365_odata_base/MSBasicCredentials.h>
#import <office365_odata_base/MSCredentialsImpl.h>

@interface MailTestRunner : BaseTestRunner

@property TestParameters *Parameters;
@property MSOutlookClient *Client;
@property NSString *TestMail;

-(id)initWithClient : (MSOutlookClient*)client;
-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *))result;

@end