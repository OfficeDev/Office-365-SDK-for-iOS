//
//  FileTests.h
//  office365-e2end-tests
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
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
