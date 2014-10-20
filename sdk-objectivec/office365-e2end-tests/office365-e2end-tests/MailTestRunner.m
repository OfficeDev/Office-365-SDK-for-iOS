//
//  ListTests.m
//  office365-e2end-tests
//
//  Created by Gustavo on 7/23/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "MailTestRunner.h"
#import "TestParameters.h"
#import "Test.h"

@implementation MailTestRunner


-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *test))result{
    
    if ([testName isEqualToString: @"TestGetUser"]) {
        return [self TestGetListsWithCompletionHandler:result];
    }
    if([testName isEqualToString:@"TestGetFolders"]){
        return [self TestGetFolders:result];
    }
    if([testName isEqualToString:@"TestGetMessages"]){
        return [self TestGetMessages:result];
    }
    
    if([testName isEqualToString:@"TestCreateFolder"]){
        return [self TestCreateFolder:result];
    }
    /*
    else{
        return [self TestDefaultWithCompletionHandler:result];
    }
     */
    
    return nil;
}

-(NSURLSessionDataTask*)TestGetListsWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[self getClient] getMe] execute:^(MSOUser *user, NSError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = (user != nil) ? @"Ok - ": @"Not - ";
        
        if(user != nil){
            passed = true;
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetFolders:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[[self getClient] getMe] getFolders] execute:^(NSArray<MSOFolder> *folders, NSError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = [folders count]>0  ? @"Ok - ": @"Not - ";
        
        if([folders count]>0){
            passed = true;
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];

    return task;
}

-(NSURLSessionDataTask*)TestGetMessages:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[[self getClient] getMe] getMessages] execute:^(NSArray<MSOMessage> *messages, NSError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = [messages count]>0  ? @"Ok - ": @"Not - ";
        
        if([messages count]>0){
            passed = true;
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCreateFolder:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOFolder *newFolder = [[MSOFolder alloc] init];
    [newFolder setDisplayName:folderName];
    
    NSURLSessionDataTask *task = [[[[[[self getClient] getMe] getFolders] getById:@"Inbox"] getChildFolders] add:newFolder:^(MSOFolder *folder, NSError *e) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if(e!= nil && newFolder.DisplayName == folderName ){
           message = @"Ok - ";
            passed = true;
        }else
        {
            message = @"Not - ";
        }
        
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(MSOEntityContainerClient*)getClient{
    NSString *token = [[[LogInController alloc] init] getBasicToken];
    
  /*  if(self.Client != nil)
        return self.Client;
    
    MSODefaultDependencyResolver* resolver = [MSODefaultDependencyResolver alloc];
    MSOBasicCredentials* credentials = [MSOBasicCredentials alloc];
    [credentials addToken:token];
    
    MSOCredentialsImpl* credentialsImpl = [MSOCredentialsImpl alloc];
    
    [credentialsImpl setCredentials:credentials];
    [resolver setCredentialsFactory:credentialsImpl];
    
    self.Client = [[MSOEntityContainerClient alloc] initWitUrl:@"https://sdfpilot.outlook.com/ews/odata" dependencyResolver:resolver];

    
    return self.Client;*/
    return nil;
}

-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    Test *test1 = [Test alloc];
    test1.TestRunner = self;
    test1.Name = @"TestGetUser";
    test1.DisplayName = @"Get User";
    
    [array addObject:test1];
    
    
    Test* test2 = [Test alloc];
    test2.TestRunner = self;
    test2.Name = @"TestGetFolders";
    test2.DisplayName = @"Get Folders";
    
    [array addObject:test2];
    
    Test* test3 = [Test alloc];
    test3.TestRunner = self;
    test3.Name = @"TestGetMessages";
    test3.DisplayName = @"Get Messages";
    
    [array addObject:test3];
    
    Test* test4 = [Test alloc];
    test4.TestRunner = self;
    test4.Name = @"TestCreateFolder";
    test4.DisplayName = @"Create Folder";
    
    //[array addObject:test4];
    
    return array;
}

@end