//
//  Test.m
//  office365-e2end-tests
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "Test.h"

@implementation Test

-(instancetype) initWithName:(NSString *)name displayName:(NSString *) displayName runner :(BaseTestRunner *)runner{
    self.Name = name;
    self.TestRunner = runner;
    self.DisplayName = displayName;
    
    return self;
}

-(NSURLSessionDataTask *)Run :(void (^) (Test*))result{

    return [self.TestRunner Run:self.Name completionHandler:^(Test *test) {
        result(test);
    }];
}

@end