//
//  FileTests.h
//  office365-e2end-tests
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"
#import "TestParameters.h"
#import <office365-files-sdk/FileClient.h>

@interface FileTestRunner : BaseTestRunner

@property TestParameters *Parameters;
@property FileClient *Client;

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *))result;

@end
