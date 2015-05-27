/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseTestRunner.h"
#import "TestParameters.h"
#import "Test.h"

@interface MailTestRunner : BaseTestRunner

@property (strong, nonatomic) TestParameters *parameters;
@property (strong, nonatomic) MSOutlookClient *client;
@property (strong, nonatomic) NSString *testMail;

- (id)initWithClient:(MSOutlookClient*)client;
- (void)run:(NSString *)testName completionHandler:(void (^) (Test *))result;

@end