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
    
    NSURLSessionDataTask* task = [[self getClient] delete:@"testFolder" callback:^(NSString *status, NSError *error) {
        [[[self getClient] delete:@"test.txt" callback:^(NSString *status, NSError *error) {
    
            if([testName isEqualToString:@"TestCreateFolder"]){
                [[self TestCreateFolderWithCompletionHandler:result] resume];
            }
            if([testName isEqualToString:@"TestCreateFileWithContent"]){
                [[self TestCreateFileWithContentWithCompletionHandler:result] resume];
            }
            else if([testName isEqualToString:@"TestGetFiles"]){
                [[self TestGetFilesWithCompletionHandler:result] resume];
            }
            else if([testName isEqualToString:@"TestGetFileById"]){
                [[self TestGetFilesByIdCompletionHandler:result] resume];
            }
            else if ([testName isEqualToString:@"TestGetFilesByFolder"]){
                [[self TestGetFilesByFolderCompletionHandler:result] resume];
            }
            else if ([testName isEqualToString:@"TestMoveFile"]){
                [[self TestMoveFileWithCompletionHandler:result]resume];
            }
        }] resume];
    }];
    
    return task;
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

-(NSURLSessionDataTask*)TestCreateFolderInFolderCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] createFolder:@"testFolder" parentFolder:nil callback:^(FileEntity *folder, NSError *error) {
        
        NSURLSessionDataTask *folderTask = [[self getClient] createFolder:@"testFolderInFolder" parentFolder:folder.Id callback:^(FileEntity *entity, NSError *error) {
            __block BOOL passed = true;
            
            if(![entity.Id isEqualToString:@"testFolderInFolder"] || ![entity isFolder]){
                passed = false;
                Test *test = [Test alloc];
                
                test.Passed = passed;
                test.ExecutionMessages = [NSMutableArray array];
                result(test);
            }
            else{
                NSURLSessionDataTask *findFolderTask = [[self getClient] getFiles:folder.Id callback:^(NSMutableArray *files, NSError *error) {
                    
                    if([files count] != 0){
                        passed = false;
                        for (FileEntity* e in files) {
                            if([e isFolder] && [e.Id  isEqualToString:@"testFolderInFolder"]){
                                passed = true;
                                break;
                            }
                        }
                    }
                    
                    Test *test = [Test alloc];
                    
                    test.Passed = passed;
                    test.ExecutionMessages = [NSMutableArray array];
                    result(test);
                }];
                
                [findFolderTask resume];
            }
        }];
        
        [folderTask resume];
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

-(NSURLSessionDataTask*)TestGetFilesByIdCompletionHandler:(void (^) (Test*))result{
    
    NSData *data =  [@"Test text for testing file sdk" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *task = [[self getClient] createFile:@"test.txt" overwrite:true body:data folder:nil :^(FileEntity *file, NSError *error) {
        
        NSURLSessionDataTask *getByIdTask = [[self getClient] getFileById:file.Id callback:^(FileEntity *fileResult, NSError * error) {
            BOOL passed = true;
            
            if(![fileResult.Name  isEqualToString: @"test.txt"] ||
               ![fileResult.Id  isEqualToString: @"test.txt"] ||
               ![fileResult.Metadata.type  isEqualToString: @"MS.FileServices.File"] ||
               fileResult.Size != 30){
                passed = false;
            }
            
            Test *test = [Test alloc];
            
            test.Passed = passed;
            test.ExecutionMessages = [NSMutableArray array];
            result(test);
        }];
        
        [getByIdTask resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetFilesByFolderCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] createFolder:@"testFolder" parentFolder:nil callback:^(FileEntity *folder, NSError *error) {
        
        NSData *data =  [@"Test text for testing file sdk" dataUsingEncoding:NSUTF8StringEncoding];
        
        NSURLSessionDataTask *createTask = [[self getClient] createFile:@"test.txt" overwrite:true body:data folder:folder.Id :^(FileEntity *file, NSError *error) {
            
            NSURLSessionDataTask *getTask = [[self getClient]getFiles:folder.Id callback:^(NSMutableArray *files, NSError *error) {
                BOOL passed = true;
                
                if ([files count] != 1) {
                    passed = false;
                }
                else if(![((FileEntity*)[files objectAtIndex:0]).Name isEqualToString:@"test.txt"]){
                    passed = false;
                }
                
                Test *test = [Test alloc];
                
                test.Passed = passed;
                test.ExecutionMessages = [NSMutableArray array];
                result(test);
            }];
            
            [getTask resume];
        }];
        
        [createTask resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestMoveFileWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] createFolder:@"testFolder" parentFolder:nil callback:^(FileEntity *folder, NSError *error) {
        
        NSData *data =  [@"Test text for testing file sdk" dataUsingEncoding:NSUTF8StringEncoding];
        
        NSURLSessionDataTask *createTask = [[self getClient] createFile:@"test.txt" overwrite:true body:data folder:nil:^(FileEntity *file, NSError *error) {
            
            NSURLSessionDataTask *moveTask = [[self getClient] move:file.Id destinationFolder:folder.Id callback:^(NSString *responseCode, NSError *error) {
                
                NSURLSessionDataTask *getFileTask = [[self getClient] getFiles:folder.Id callback:^(NSMutableArray *files, NSError *error) {
                    
                    BOOL passed = true;
                    
                    if ([files count] != 1) {
                        passed = false;
                    }
                    else if(![((FileEntity*)[files objectAtIndex:0]).Name isEqualToString:@"test.txt"]){
                        passed = false;
                    }
                    
                    Test *test = [Test alloc];
                    
                    test.Passed = passed;
                    test.ExecutionMessages = [NSMutableArray array];
                    result(test);
                }];
                
                [getFileTask resume];
            }];
            
            [moveTask resume];
        }];
        
        [createTask resume];
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
    NSMutableArray *tests = [NSMutableArray array];
    
    Test *createFolderTest = [Test alloc];
    createFolderTest.TestRunner = self;
    createFolderTest.Name = @"TestCreateFolder";
    createFolderTest.DisplayName = @"Create Folder";
    
    Test *createFileWithContentTest = [Test alloc];
    createFileWithContentTest.TestRunner = self;
    createFileWithContentTest.Name = @"TestCreateFileWithContent";
    createFileWithContentTest.DisplayName = @"Create File With Content";
    
    Test *testGetById = [Test alloc];
    testGetById.TestRunner = self;
    testGetById.Name = @"TestGetFileById";
    testGetById.DisplayName = @"Get File By Id";
    
    Test *getFilesTest = [Test alloc];
    getFilesTest.TestRunner = self;
    getFilesTest.Name = @"TestGetFiles";
    getFilesTest.DisplayName = @"Get Files";
    
    Test *getFilesByFolderTest = [Test alloc];
    getFilesByFolderTest.TestRunner = self;
    getFilesByFolderTest.Name = @"TestGetFilesByFolder";
    getFilesByFolderTest.DisplayName = @"Get Files By Folder";
    
    Test *moveFileTest = [Test alloc];
    moveFileTest.TestRunner = self;
    moveFileTest.Name = @"TestMoveFile";
    moveFileTest.DisplayName = @"Get Move File";
    
    [tests addObject:createFolderTest];
    [tests addObject:testGetById];
    [tests addObject:createFileWithContentTest];
    [tests addObject:getFilesTest];
    [tests addObject:getFilesByFolderTest];
    [tests addObject:moveFileTest];
    
    return tests;
}

@end