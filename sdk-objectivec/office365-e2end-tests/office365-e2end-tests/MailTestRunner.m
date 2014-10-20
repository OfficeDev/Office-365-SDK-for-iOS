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

-(id)initWithClient : (MSOEntityContainerClient*)client{
    self.Client = client;
    return self;
}

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *test))result{
    
    if ([testName isEqualToString: @"TestGetUser"]) {
        return [self TestGetUser:result];
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

-(NSURLSessionDataTask*)TestGetUser:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self.Client getMe] execute:^(MSOUser *user, NSError *error) {
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
    
    NSURLSessionDataTask *task = [[[self.Client getMe] getFolders] execute:^(NSArray<MSOFolder> *folders, NSError *error) {
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
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] execute:^(NSArray<MSOMessage> *messages, NSError *error) {
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
    
    NSURLSessionDataTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] add:newFolder:^(MSOFolder *folder, NSError *e) {
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


-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUser" :@"Get User" ]];
    
    [array addObject:[[Test alloc] initWithData:self :@"TestGetFolders" :@"Get Folders" ]];
   
    [array addObject:[[Test alloc] initWithData:self :@"TestGetMessages" :@"Get Messages" ]];
    
   // [array addObject:[[Test alloc] initWithData:self :@"TestCreateFolder" :@"Create Folder" ]];
    
    return array;
}

@end