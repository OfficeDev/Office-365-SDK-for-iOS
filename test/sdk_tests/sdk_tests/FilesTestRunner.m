/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "FilesTestRunner.h"

@interface FilesTestRunner()

@property (nonatomic, weak) FilesTestRunner* weakSelf;

@end

@implementation FilesTestRunner

- (id)initWithClient:(MSFilesClient *)client {
    
    if (self = [super init]) {
     
        self.client = client;
        _weakSelf = self;
    }
    
    return self;
}

- (void)run:(NSString *)testName completionHandler:(void (^) (id test))result {
    
    if([testName isEqualToString: @"TestGetFiles"]) return [self TestGetFiles:result];
    if([testName isEqualToString: @"TestGetFileById"]) return [self TestGetFileById:result];
    if([testName isEqualToString: @"TestCreateFileWithContent"]) return [self TestCreateFileWithContent:result];
    if([testName isEqualToString: @"TestCreateFileWithStreamContent"]) return [self TestCreateFileWithStreamContent:result];
    if([testName isEqualToString: @"TestUpdateFileContent"]) return [self TestUpdateFileContent:result];
    if([testName isEqualToString: @"TestGetDrive"]) return [self TestGetDrive:result];
    if([testName isEqualToString: @"TestTopFiles"]) return [self TestTopFiles:result];
    if([testName isEqualToString: @"TestSelectFiles"]) return [self TestSelectFiles:result];
    if([testName isEqualToString: @"TestDeleteFile"]) return [self TestDeleteFile:result];
}

- (NSMutableArray *)getTests {
    
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetFiles" displayName:@"Get Files" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetFileById" displayName:@"Get File By Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateFileWithContent" displayName:@"Create Files with content"]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateFileWithStreamContent" displayName:@"Create Files with stream content" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestUpdateFileContent" displayName:@"Update files content" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetDrive" displayName:@"Get drive" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestTopFiles" displayName:@"Top Files" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSelectFiles" displayName:@"Select Files" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteFile" displayName:@"Delete Files" ]];
    
    return array;
}


-(void)TestGetFiles:(void (^) (Test *))result{
    
    return [self.client.files readWithCallback:^(NSArray *items, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && items != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}


-(void)TestGetFileById:(void (^) (Test*))result{
    MSFilesItem *itemToAdd = [self GetFileItem];
    
    // Add new item
    return [_weakSelf.client.files add:itemToAdd callback:^(MSFilesItem *addedItem, MSOrcError *e) {
        
        //Get item
        [[_weakSelf.client.files getById:addedItem._id] readWithCallback:^(MSFilesItem *item, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = @"";
            
            if(error == nil && item != nil && [item._id isEqualToString:addedItem._id]){
                passed = TRUE;
                message = @"Ok - ";
            }
            else{
                message = @"Not - ";
                if(error != nil)
                    message = [message stringByAppendingString:[error localizedDescription]];
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            //cleanup
            if (addedItem!= nil) {
                [[[_weakSelf.client.files getById:addedItem._id] addCustomHeaderWithName:@"If-Match" value:@"*"] deleteWithCallback:^(int status, MSOrcError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            }
            
            result(test);
        }];
    }];
}

-(void)TestCreateFileWithContent:(void (^) (Test*))result{
    
    MSFilesItem *itemToAdd = [self GetFileItem];
    NSData *content =[@"Test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    
    //Create file
    return [_weakSelf.client.files add:itemToAdd callback:^(MSFilesItem *addedItem, MSOrcError *error) {
        //Put content to file
        
        [[[_weakSelf.client.files getById:addedItem._id] asFile] putContent:content callback:^(NSInteger putContentResult, MSOrcError *error) {
            
            //Get file content
            [[[_weakSelf.client.files getById:addedItem._id] asFile] getContentWithCallback:^(NSData *addedContent, MSOrcError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                test.executionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                
                if(error == nil && addedItem != nil && [content isEqualToData:addedContent]){
                    passed = TRUE;
                    message = @"Ok - ";
                }
                else{
                    message = @"Not - ";
                    if(error != nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                
                //Cleanup
                if (addedItem != nil) {
                    
                    [[[_weakSelf.client.files getById:addedItem._id] addCustomHeaderWithName:@"If-Match" value:@"*"]
                      deleteWithCallback:^(int status, MSOrcError *error) {
                        
                          if(error!= nil)
                            NSLog(@"Error: %@", error);
                    
                      }];
                }
                
                result(test);
            }];
        }];
    }];
}

-(void)TestCreateFileWithStreamContent:(void (^) (Test*))result {
    
    MSFilesItem *itemToAdd = [self GetFileItem];
    NSData *content =[@"Test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    
    //Create file
    return [_weakSelf.client.files add:itemToAdd callback:^(MSFilesItem *addedItem, MSOrcError *error) {
        //Put content to file
        NSInputStream *streamContent = [[NSInputStream alloc] initWithData:content];
        NSInteger size = content.length;
        
        [[[self.client.files getById:addedItem._id]asFile] putContent:streamContent withSize:size callback:^(NSInteger response, MSOrcError *error) {
            //Get file content
            [[[_weakSelf.client.files getById:addedItem._id] asFile ] getContentWithCallback:^(NSData *addedContent, MSOrcError *error) {
                BOOL passed = false;
                
                Test *test = [Test alloc];
                test.executionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                
                if(error == nil && addedItem != nil && [content isEqualToData:addedContent]){
                    passed = TRUE;
                    message = @"Ok - ";
                }
                else{
                    message = @"Not - ";
                    if(error != nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                
                //Cleanup
                if (addedItem!= nil) {
                    
                    [[[_weakSelf.client.files getById:addedItem._id] addCustomHeaderWithName:@"If-Match" value:@"*"] deleteWithCallback:^(int status, MSOrcError *error) {
                        
                        if (error!= nil)
                            NSLog(@"Error: %@", error);
                    
                    }];
                }
                
                result(test);
            }];
        }];
    }];
}


-(void)TestUpdateFileContent:(void (^) (Test*))result {
    
    MSFilesItem *itemToAdd = [self GetFileItem];
    NSData *content =[@"Test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    NSData *updatedContent = [@"Updated test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    
    //Create file
    return [_weakSelf.client.files add:itemToAdd callback:^(MSFilesItem *addedItem, MSOrcError *error) {
        //Put content to file
        [[[_weakSelf.client.files getById:addedItem._id] asFile] putContent:content callback:^(NSInteger putContentResult, MSOrcError *error) {
            
            [[[_weakSelf.client.files getById:addedItem._id] asFile] putContent:updatedContent
                                                                     callback:^(NSInteger updatedContentResult, MSOrcError *error) {
                
                //Get file content
                [[[_weakSelf.client.files getById:addedItem._id] asFile] getContentWithCallback:^(NSData *newContent, MSOrcError *error) {
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    test.executionMessages = [NSMutableArray array];
                    
                    NSString* message = @"";
                    
                    if(error == nil && addedItem != nil && [updatedContent isEqualToData:newContent]){
                        passed = TRUE;
                        message = @"Ok - ";
                    }
                    else{
                        message = @"Not - ";
                        if(error != nil)
                            message = [message stringByAppendingString:[error localizedDescription]];
                    }
                    
                    test.passed = passed;
                    [test.executionMessages addObject:message];
                    
                    //Cleanup
                    if (addedItem!= nil) {
                        
                        [[[_weakSelf.client.files getById:addedItem._id] addCustomHeaderWithName:@"If-Match" value:@"*"]
                          deleteWithCallback:^(int status, MSOrcError *error) {
                              
                            if (error!= nil)
                                NSLog(@"Error: %@", error);
                              
                        }];
                    }
                    
                    result(test);
                    
                }];
            }];
        }];
    }];
}

-(void)TestGetDrive:(void (^) (Test*))result{
    
    return [self.client.drive readWithCallback:^(MSFilesDrive *drive, MSOrcError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && drive != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

-(void)TestTopFiles:(void (^) (Test*))result{
    
    MSFilesItem *itemToAdd = [self GetFileItem];
    MSFilesItem *itemToAdd2 = [self GetFileItem];
    
    // Add new item
    return [_weakSelf.client.files add:itemToAdd callback:^(MSFilesItem *addedItem, MSOrcError *e) {
        
        //Add second item
        [_weakSelf.client.files add:itemToAdd2 callback:^(MSFilesItem *addedItem2, MSOrcError *e) {
            
            //Get top 1 item
            [[_weakSelf.client.files top:1] readWithCallback:^(NSArray *items, MSOrcError *error) {
                BOOL passed = false;
                
                Test *test = [Test alloc];
                test.executionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                
                if(error == nil && items.count ==1){
                    passed = TRUE;
                    message = @"Ok - ";
                }
                else{
                    message = @"Not - ";
                    if(error != nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                
                //cleanup
                if (addedItem!= nil) {
                    [[[_weakSelf.client.files getById:addedItem._id]addCustomHeaderWithName:@"If-Match" value:@"*"]deleteWithCallback:^(int status, MSOrcError *error) {
                        
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    
                    }];
                }
                
                if(addedItem2!= nil)
                    [[[_weakSelf.client.files getById:addedItem2._id] addCustomHeaderWithName:@"If-Match"
                                                                                      value:@"*"]deleteWithCallback:^(int status, MSOrcError *error) {
                        
                        if (error!= nil)
                            NSLog(@"Error: %@", error);
                    
                    }];
                
                result(test);
            }];
        }];
    }];
}

-(void)TestSelectFiles:(void (^) (Test*))result{
    
    MSFilesItem *itemToAdd = [self GetFileItem];
    
    // Add new item
    return [_weakSelf.client.files add:itemToAdd callback:^(MSFilesItem *addedItem, MSOrcError *e) {
        //Get item
        [[[_weakSelf.client.files select:@"name,dateTimeCreated"] top:1] readWithCallback:^(NSArray *items, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = @"";
            
            MSFilesItem *selectedItem = nil;
            
            if(items.count > 0){
                selectedItem =(MSFilesItem *)[items objectAtIndex:0];
            }
            
            if(error == nil && selectedItem != nil && ![selectedItem.name isEqualToString:@""] && selectedItem.dateTimeLastModified == nil ){
                passed = TRUE;
                message = @"Ok - ";
            }
            else{
                message = @"Not - ";
                if(error != nil)
                    message = [message stringByAppendingString:[error localizedDescription]];
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            //cleanup
            if (addedItem!= nil) {
                
                [[[_weakSelf.client.files getById:addedItem._id] addCustomHeaderWithName:@"If-Match" value:@"*"] deleteWithCallback:^(int status, MSOrcError *error) {
                   
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                
                }];
            }
            
            result(test);
        }];
    }];
}


-(void)TestDeleteFile:(void (^) (Test*))result{
    
    MSFilesItem *itemToAdd = [self GetFileItem];
    
    // Add new item
    return [_weakSelf.client.files add:itemToAdd callback:^(MSFilesItem *addedItem, MSOrcError *e) {
        //Delete item
        
        [[[_weakSelf.client.files getById:addedItem._id] addCustomHeaderWithName:@"If-Match" value:@"*"] deleteWithCallback:^(int status, MSOrcError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = @"";
            
            if(error == nil){
                passed = TRUE;
                message = @"Ok - ";
            }
            else{
                message = @"Not - ";
                if(error != nil)
                    message = [message stringByAppendingString:[error localizedDescription]];
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            result(test);
            
        }];
    }];
}

- (MSFilesItem *)GetFileItem {
    
    NSString *fileName = [[[NSUUID UUID] UUIDString] stringByAppendingString:@".txt"];
    MSFilesItem *item = [[MSFilesItem alloc] init];

    [item setType:@"File"];
    [item setName:fileName];
    return item;
}

@end