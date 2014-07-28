//
//  FileTests.m
//  office365-e2end-tests
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "FileTests.h"
#import "Test.h"
//#import "office365-files-sdk/FileClient.h"

@implementation FileTests
/*
-(NSURLSessionDataTask*)shouldGetFiles response:(void (^)(NSData *, NSURLResponse *, NSError *))response{

    return nil;
}*/

-(void)TestGetFilesWithCompletionHandler:(void (^) (Test*))result{

  /*  Credentials* credentials;
    FileClient* client = [[FileClient alloc] initWithUrl:@"" credentials:credentials];
    
    NSURLSessionDataTask* task = [client getFiles:nil
                                         callback:^(NSData *data, NSURLResponse *response, NSError *error) {
                                             
                                             Test* test = [Test alloc];
                                             
                                             result(test);
        
    }];
    
    [task resume];*/
}

@end