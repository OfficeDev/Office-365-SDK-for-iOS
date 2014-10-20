//
//  Test.m
//  office365-e2end-tests
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

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