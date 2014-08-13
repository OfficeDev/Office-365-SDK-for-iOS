//
//  FileTests.m
//  office365-e2end-tests
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "FileTestRunner.h"
#import <office365-files-sdk/FileEntity.h>

@implementation FileTestRunner

-(void)cleanUp{
    [[[self getClient] delete:@"testFolder" callback:^(NSString *status, NSError *error) {}] resume];
    
    [[[self getClient] delete:@"createTestFolder" callback:^(NSString *status, NSError *error) {}] resume];
    [[[self getClient] delete:@"moveTestFolder" callback:^(NSString *status, NSError *error) {}] resume];
    [[[self getClient] delete:@"copyTestFolder" callback:^(NSString *status, NSError *error) {}] resume];
    [[[self getClient] delete:@"getFileByFolder" callback:^(NSString *status, NSError *error) {}] resume];
    
    [[[self getClient] delete:@"test.txt" callback:^(NSString *status, NSError *error) {}] resume];
    
    [[[self getClient] delete:@"moveTest.txt" callback:^(NSString *status, NSError *error) {}] resume];
    [[[self getClient] delete:@"testFolder" callback:^(NSString *status, NSError *error) {}] resume];
    [[[self getClient] delete:@"copyTest.txt" callback:^(NSString *status, NSError *error) {}] resume];
    [[[self getClient] delete:@"getFileByFolder.txt" callback:^(NSString *status, NSError *error) {}] resume];
}

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *test))result{
    
    if([testName isEqualToString:@"TestCreateFolder"]){
        return [self TestCreateFolderWithCompletionHandler:result];
    }
    if([testName isEqualToString:@"TestCreateFileWithContent"]){
        return [self TestCreateFileWithContentWithCompletionHandler:result];
    }
    if([testName isEqualToString:@"TestGetFiles"]){
        return [self TestGetFilesWithCompletionHandler:result];
    }
    if([testName isEqualToString:@"TestGetFileById"]){
        return [self TestGetFilesByIdCompletionHandler:result];
    }
    if ([testName isEqualToString:@"TestGetFilesByFolder"]){
        return [self TestGetFilesByFolderCompletionHandler:result];
    }
    if ([testName isEqualToString:@"TestMoveFile"]){
        return [self TestMoveFileWithCompletionHandler:result];
    }
    if ([testName isEqualToString:@"TestCopyFile"]){
        return [self TestCopyFileWithCompletionHandler:result];
    }
    if ([testName isEqualToString:@"TestDeleteFile"]){
        return [self TestDeleteFileWithCompletionHandler:result];
    }
    
    return nil;
}

-(NSURLSessionDataTask*)TestCreateFileWithContentWithCompletionHandler:(void (^) (Test*))result{
    
    NSData *data =  [@"Test text for testing file sdk" dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *task = [[self getClient] delete:@"test.txt" callback:^(NSString *status, NSError *error) {
        
     [[[self getClient] createFile:@"test.txt" overwrite:true body:data folder:nil :^(FileEntity *file, NSError *error) {
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
    }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCreateFolderInFolderCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] delete:@"testFolder" callback:^(NSString *status, NSError *error) {
        
     [[[self getClient] createFolder:@"testFolder" parentFolder:nil callback:^(FileEntity *folder, NSError *error) {
        
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
     }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCreateFolderWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] delete:@"createTestFolder" callback:^(NSString *status, NSError *error) {
        
        [[[self getClient] createFolder:@"createTestFolder" parentFolder:nil callback:^(FileEntity *folder, NSError *error) {
            
            BOOL passed = true;
            
            if(![folder.Name  isEqualToString: @"createTestFolder"] ||
               ![folder.Id  isEqualToString: @"createTestFolder"] ||
               ![folder isFolder] ||
               folder.Size != 0){
                passed = false;
            }
            
            Test *test = [Test alloc];
            
            test.Passed = passed;
            test.ExecutionMessages = [NSMutableArray array];
            result(test);
        }] resume];
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
    
    NSURLSessionDataTask *task = [[self getClient] delete:@"test.txt" callback:^(NSString *status, NSError *error) {
        
        NSData *data =  [@"Test text for testing file sdk" dataUsingEncoding:NSUTF8StringEncoding];
        
        [[[self getClient] createFile:@"test.txt" overwrite:true body:data folder:nil :^(FileEntity *file, NSError *error) {
            
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
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetFilesByFolderCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] delete:@"getFileByFolder" callback:^(NSString *status, NSError *error) {
        
        [[[self getClient] createFolder:@"getFileByFolder" parentFolder:nil callback:^(FileEntity *folder, NSError *error) {
            
            NSData *data =  [@"Test text for testing file sdk" dataUsingEncoding:NSUTF8StringEncoding];
            
            NSURLSessionDataTask *createTask = [[self getClient] createFile:@"getFileByFolder.txt" overwrite:true body:data folder:folder.Id :^(FileEntity *file, NSError *error) {
                
                NSURLSessionDataTask *getTask = [[self getClient]getFiles:folder.Id callback:^(NSMutableArray *files, NSError *error) {
                    BOOL passed = true;
                    
                    if ([files count] != 1) {
                        passed = false;
                    }
                    else if(![((FileEntity*)[files objectAtIndex:0]).Name isEqualToString:@"getFileByFolder.txt"]){
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
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCopyFileWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] delete:@"copyTestFolder" callback:^(NSString *status, NSError *error) {
        
        [[[self getClient] createFolder:@"copyTestFolder" parentFolder:nil callback:^(FileEntity *folder, NSError *error) {
            
            NSData *data =  [@"Test text for testing file sdk" dataUsingEncoding:NSUTF8StringEncoding];
            
            NSURLSessionDataTask *createTask = [[self getClient] createFile:@"copyTest.txt" overwrite:true body:data folder:nil:^(FileEntity *file, NSError *error) {
                
                NSURLSessionDataTask *copyTask =[[self getClient] copy:file.Id destinationFolder:folder.Id callback:^(NSString *status, NSError *error) {
                    
                    NSURLSessionDataTask *getFileTask = [[self getClient] getFiles:folder.Id callback:^(NSMutableArray *files, NSError *error)                 {
                        
                        BOOL passed = true;
                        
                        if ([files count] != 1) {
                            passed = false;
                        }
                        else if(![((FileEntity*)[files objectAtIndex:0]).Name isEqualToString:@"copyTest.txt"]){
                            passed = false;
                        }
                        
                        Test *test = [Test alloc];
                        
                        test.Passed = passed;
                        test.ExecutionMessages = [NSMutableArray array];
                        result(test);
                    }];
                    
                    [getFileTask resume];
                }];
                
                [copyTask resume];
            }];
            
            [createTask resume];
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestMoveFileWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] delete:@"moveTestFolder" callback:^(NSString *status, NSError *error) {
        
        [[[self getClient] createFolder:@"moveTestFolder" parentFolder:nil callback:^(FileEntity *folder, NSError *error) {
            
            NSData *data =  [@"Test text for testing file sdk" dataUsingEncoding:NSUTF8StringEncoding];
            
            NSURLSessionDataTask *createTask = [[self getClient] createFile:@"moveTest.txt" overwrite:true body:data folder:nil:^(FileEntity *file, NSError *error) {
                
                NSURLSessionDataTask *moveTask = [[self getClient] move:file.Id destinationFolder:folder.Id callback:^(NSString *responseCode, NSError *error) {
                    
                    NSURLSessionDataTask *getFileTask = [[self getClient] getFiles:folder.Id callback:^(NSMutableArray *files, NSError *error) {
                        
                        BOOL passed = true;
                        
                        if ([files count] != 1) {
                            passed = false;
                        }
                        else if(![((FileEntity*)[files objectAtIndex:0]).Name isEqualToString:@"moveTest.txt"]){
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
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestDeleteFileWithCompletionHandler:(void (^) (Test*))result{
    
    NSData *data =  [@"Test text for testing file sdk" dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *task = [[self getClient] createFile:@"deleteFileTest.txt" overwrite:true body:data folder:nil :^(FileEntity *file, NSError *error) {
        
        [[[self getClient] delete:@"deleteFileTest.txt" callback:^(NSString *status, NSError *error) {
        
            [[[self getClient] getFileById:file.Id callback:^(FileEntity *file, NSError *error) {
                BOOL passed = true;
                
                if(file.Name  != nil ||
                   file.Id  != nil  ||
                   //file.Metadata  != nil  ||
                   file.Size != 0){
                    passed = false;
                }
                
                Test *test = [Test alloc];
                
                test.Passed = passed;
                test.ExecutionMessages = [NSMutableArray array];
                result(test);

            }] resume];
        
        }] resume];
        
        
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
    
    [self cleanUp];
    
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
    
    Test *copyFileTest = [Test alloc];
    copyFileTest.TestRunner = self;
    copyFileTest.Name = @"TestCopyFile";
    copyFileTest.DisplayName = @"Copy File";
    
    Test *moveFileTest = [Test alloc];
    moveFileTest.TestRunner = self;
    moveFileTest.Name = @"TestMoveFile";
    moveFileTest.DisplayName = @"Move File";
    
    Test *deleteFileTest = [Test alloc];
    deleteFileTest.TestRunner = self;
    deleteFileTest.Name = @"TestDeleteFile";
    deleteFileTest.DisplayName = @"Delete File";
    
    Test *downloadFileTest = [Test alloc];
    downloadFileTest.TestRunner = self;
    downloadFileTest.Name = @"TestDownloadFile";
    downloadFileTest.DisplayName = @"Download File";
    
    [tests addObject:createFolderTest];
    [tests addObject:createFileWithContentTest];
    [tests addObject:testGetById];
    [tests addObject:getFilesTest];
    [tests addObject:getFilesByFolderTest];
    [tests addObject:copyFileTest];
    [tests addObject:moveFileTest];
    [tests addObject:deleteFileTest];
   // [tests addObject:downloadFileTest];
    
    return tests;
}

@end