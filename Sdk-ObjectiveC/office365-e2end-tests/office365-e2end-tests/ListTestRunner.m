//
//  ListTests.m
//  office365-e2end-tests
//
//  Created by Gustavo on 7/23/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "ListTestRunner.h"
#import <office365-lists-sdk/ListEntity.h>
#import "TestParameters.h"
#import "Test.h"

@implementation ListTestRunner

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *test))result{
    
    if ([testName isEqualToString: @"TestGetLists"]) {
        return [self TestGetListsWithCompletionHandler:result];
    }
    if([testName isEqualToString:@"TestGetClientListError"]){
        return [self TestGetClientListsErrorWithCompletionHandler:result];
    }
    else{
        return [self TestDefaultWithCompletionHandler:result];
    }
    
    return nil;
}

-(NSURLSessionDataTask*)TestGetListsWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] getLists:^(NSMutableArray *lists, NSError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = [lists count] > 0 ? @"Ok - ": @"Not - ";
        
        if([lists count] > 0){
            
            for (ListEntity *entity in lists) {
                if(entity.Id == nil || entity.Title == nil){
                    passed = false;
                    break;
                }
                passed = true;
            }
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask *)TestGetClientListsErrorWithCompletionHandler:(void (^) (Test *))result{
    
    ListClient *client = [ListClient alloc];
    self.Client = [client initWithUrl:nil  credentials:self.Parameters.Credentials];
    
    NSURLSessionDataTask *task = [client getLists:^(NSMutableArray *lists, NSError *error) {
   
        Test *test = [Test alloc];
        test.Passed = error.code == -1002;
        test.ExecutionMessages = [NSMutableArray array];
        result(test);
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestDefaultWithCompletionHandler:(void (^) (Test *))result{

    NSURLSessionDataTask* task = [[self getClient] getLists:^(NSMutableArray *lists, NSError *error) {
        
        Test *test = [Test alloc];
        test.Passed = false;
        test.ExecutionMessages = [NSMutableArray array];
        result(test);
    }];
    
    return task;
}

-(ListClient*)getClient{
    
    if(self.Client != nil)
        return self.Client;
    
    ListClient *client = [ListClient alloc];
    self.Client = [client initWithUrl:self.Parameters.ServiceUrl  credentials:self.Parameters.Credentials];
    
    return self.Client;
}

-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    Test *test = [Test alloc];
    test.TestRunner = self;
    test.Name = @"TestGetLists";
    test.DisplayName = @"Get Lists";
    
    [array addObject:test];
    
    Test* testClient = [Test alloc];
    testClient.TestRunner = self;
    testClient.Name = @"TestGetClientListError";
    testClient.DisplayName = @"Get Client List Error";
    
    [array addObject:testClient];
    
    return array;
}

@end