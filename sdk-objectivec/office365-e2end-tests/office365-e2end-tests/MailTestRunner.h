/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseTestRunner.h"
#import "TestParameters.h"
#import "Test.h"

@interface MailTestRunner : BaseTestRunner

@property TestParameters *Parameters;
@property MSOutlookServicesClient *Client;
@property NSString *TestMail;

-(id)initWithClient : (MSOutlookServicesClient*)client;
-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *))result;

@end