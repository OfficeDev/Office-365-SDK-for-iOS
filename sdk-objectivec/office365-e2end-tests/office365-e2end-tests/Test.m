/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "Test.h"

@implementation Test

-(id) initWithData : (BaseTestRunner*) testRunner : (NSString *)name : (NSString *)displyName{
    self.TestRunner = testRunner;
    self.Name = name;
    self.DisplayName = displyName;
    
    return self;
}

-(NSURLSessionDataTask *)Run :(void (^) (Test*))result{

    return [self.TestRunner Run:self.Name completionHandler:^(Test *test) {
        result(test);
    }];
}

@end