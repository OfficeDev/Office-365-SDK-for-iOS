//
//  ListTests.h
//  office365-e2end-tests
//
//  Created by Gustavo on 7/23/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <office365-lists-sdk/ListClient.h>
#import "BaseTestRunner.h"
#import "TestParameters.h"
#import "Test.h"

@interface ListTestRunner : BaseTestRunner

@property TestParameters *Parameters;
@property ListClient *Client;

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *))result;

@end