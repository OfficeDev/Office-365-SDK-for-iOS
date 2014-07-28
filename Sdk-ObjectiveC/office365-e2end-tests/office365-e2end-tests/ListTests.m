//
//  ListTests.m
//  office365-e2end-tests
//
//  Created by Gustavo on 7/23/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "ListTests.h"
#import "office365-lists-sdk/ListClient.h"
#import "TestParameters.h"
#import "Test.h"

@implementation ListTests

-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    Test* test = [Test alloc];
    test.TestRunner = self;
    
    test.Name = @"TestGetLists";
    test.DisplayName = @"Get Lists";
    
    [array addObject:test];
    
    return array;
}

-(NSURLSessionDataTask*)Run : (NSString*)testName completionHandler:(void (^) (Test* test))result{
    
    if ([testName isEqual: @"TestGetLists"]) {
        return [self TestGetListsWithCompletionHandler:result];
    }
    
    return nil;
}

-(NSURLSessionDataTask*)TestGetListsWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask* task = [[self getClient] getLists:^(NSMutableArray *lists, NSError *error) {
        
        Test* test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = [lists count] > 0 ? @"Ok - ": @"Not - ";
        
        test.Passed = true;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(ListClient*)getClient{
    
    if(self.Client != nil)
        return self.Client;
    
    ListClient* client = [ListClient alloc];
    self.Client = [client initWithUrl:self.Parameters.ServiceUrl  credentials:self.Parameters.Credentials];
    
    return self.Client;
}

@end