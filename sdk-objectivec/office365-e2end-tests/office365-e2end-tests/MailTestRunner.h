/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseTestRunner.h"
#import "TestParameters.h"
#import "Test.h"
#import "BaseController.h"

@interface MailTestRunner : BaseTestRunner

@property TestParameters *Parameters;
@property MSOutlookClient *Client;
@property NSString *TestMail;

-(id)initWithClient : (MSOutlookClient*)client;
-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *))result;

@end