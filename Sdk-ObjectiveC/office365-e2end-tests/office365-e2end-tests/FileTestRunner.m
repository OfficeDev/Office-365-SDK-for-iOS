//
//  FileTests.m
//  office365-e2end-tests
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "FileTestRunner.h"
#import <office365-files-sdk/FileEntity.h>

@implementation FileTestRunner

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *test))result{
    
    if([testName isEqualToString:@"TestCreateFileWithContent"]){
        return [self TestCreateFileWithContentWithCompletionHandler:result];
    }
    else if([testName isEqualToString:@"TestCreateFolder"]){
        return [self TestCreateFolderWithCompletionHandler:result];
    }
    else if([testName isEqualToString:@"TestGetFiles"]){
        return [self TestGetFilesWithCompletionHandler:result];
    }
    
    return nil;
}

-(NSURLSessionDataTask*)TestCreateFileWithContentWithCompletionHandler:(void (^) (Test*))result{
    
    NSData *data =  [@"Test text for testing file sdk" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *task = [[self getClient] createFile:@"test.txt" overwrite:true body:data folder:nil :^(FileEntity *file, NSError *error) {
        BOOL passed = true;
        
        if(![file.Name  isEqualToString: @"test.txt"] ||
           ![file.Id  isEqualToString: @"test.txt"] ||
           ![file.Metadata.type  isEqualToString: @"MS.FileServices.File"] ||
           file.Size != 30){
            passed = false;
        }
        
        Test *test = [Test alloc];
        
        test.Passed = passed;
        test.ExecutionMessages = [NSMutableArray array];
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCreateFolderWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] createFolder:@"testFolder" parentFolder:nil callback:^(FileEntity *folder, NSError *error) {
        
        BOOL passed = true;
        
        if(![folder.Name  isEqualToString: @"testFolder"] ||
           ![folder.Id  isEqualToString: @"testFolder"] ||
           ![folder isFolder] ||
           folder.Size != 0){
            passed = false;
        }
        
        Test *test = [Test alloc];
        
        test.Passed = passed;
        test.ExecutionMessages = [NSMutableArray array];
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetFilesWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] getFiles:^(NSMutableArray *files, NSError *error) {
        BOOL passed = true;
        
        if([files count] == 0){
            passed = false;
        }
        
        for (FileEntity* file in files) {
            if(file.Id == nil){
                passed = false;
                break;
            }
        }
        
        Test *test = [Test alloc];
        
        test.Passed = passed;
        test.ExecutionMessages = [NSMutableArray array];
        result(test);
    }];
    
    return task;
}

-(FileClient *)getClient{
    
    if(self.Client != nil) return self.Client;
    
    FileClient *client = [FileClient alloc];
    self.Client = [client initWithUrl:self.Parameters.ServiceUrl  credentials:self.Parameters.Credentials];
    
    return self.Client;
}

-(NSMutableArray *)getTests{
    NSMutableArray *array = [NSMutableArray array];
    
    Test *folderTest = [Test alloc];
    folderTest.TestRunner = self;
    folderTest.Name = @"TestCreateFolder";
    folderTest.DisplayName = @"Create Folder";
    
    Test *test = [Test alloc];
    test.TestRunner = self;
    test.Name = @"TestCreateFileWithContent";
    test.DisplayName = @"Create File With Content";
    
    
    Test *getFilesTest = [Test alloc];
    getFilesTest.TestRunner = self;
    getFilesTest.Name = @"TestGetFiles";
    getFilesTest.DisplayName = @"Get Files";
    
    [array addObject:folderTest];
    [array addObject:test];
    [array addObject:getFilesTest];
    
    return array;
}

@end