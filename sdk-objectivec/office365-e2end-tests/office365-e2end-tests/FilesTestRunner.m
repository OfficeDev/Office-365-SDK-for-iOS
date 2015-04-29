/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "FilesTestRunner.h"

@implementation FilesTestRunner

- (id)initWithClient:(MSSharePointClient *)client {
    self.Client = client;
    return self;
}

-(NSURLSessionTask *)Run : (NSString *)testName completionHandler:(void (^) (id test))result{
    
    if([testName isEqualToString: @"TestGetFiles"]) return [self TestGetFiles:result];
    if([testName isEqualToString: @"TestGetFileById"]) return [self TestGetFileById:result];
    if([testName isEqualToString: @"TestCreateFileWithContent"]) return [self TestCreateFileWithContent:result];
    if([testName isEqualToString: @"TestCreateFileWithStreamContent"]) return [self TestCreateFileWithStreamContent:result];
    if([testName isEqualToString: @"TestUpdateFileContent"]) return [self TestUpdateFileContent:result];
    if([testName isEqualToString: @"TestGetDrive"]) return [self TestGetDrive:result];
    if([testName isEqualToString: @"TestTopFiles"]) return [self TestTopFiles:result];
    if([testName isEqualToString: @"TestSelectFiles"]) return [self TestSelectFiles:result];
    if([testName isEqualToString: @"TestDeleteFile"]) return [self TestDeleteFile:result];
    
    return nil;
}

-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self :@"TestGetFiles" :@"Get Files" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetFileById" :@"Get File By Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateFileWithContent" :@"Create Files with content"]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateFileWithStreamContent" :@"Create Files with stream content" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateFileContent" :@"Update files content" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetDrive" :@"Get drive" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestTopFiles" :@"Top Files" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSelectFiles" :@"Select Files" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteFile" :@"Delete Files" ]];
    
    return array;
}


-(NSURLSessionTask*)TestGetFiles:(void (^) (Test *))result{
    
    NSURLSessionTask *task = [[self.Client getfiles] readWithCallback:^(NSArray<MSSharePointItem> *items, MSODataException *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
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
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}


-(NSURLSessionTask*)TestGetFileById:(void (^) (Test*))result{
    MSSharePointItem *itemToAdd = [self GetFileItem];
    // Add new item
    NSURLSessionTask *task = [[self.Client getfiles] addEntity:itemToAdd callback:^(MSSharePointItem *addedItem, MSODataException *e) {
        //Get item
        [[[[self.Client getfiles] getById:addedItem.id]readWithCallback:^(MSSharePointItem *item, MSODataException *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = @"";
            
            if(error == nil && item != nil && [item.id isEqualToString:addedItem.id]){
                passed = TRUE;
                message = @"Ok - ";
            }
            else{
                message = @"Not - ";
                if(error != nil)
                    message = [message stringByAppendingString:[error localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            //cleanup
            if(addedItem!= nil)
                [[[[[self.Client getfiles]getById:addedItem.id] addCustomHeaderWithName:@"If-Match" value:@"*"] deleteWithCallback:^(int status, MSODataException *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }]resume];
            
            
            result(test);
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestCreateFileWithContent:(void (^) (Test*))result{
    
    MSSharePointItem *itemToAdd = [self GetFileItem];
    NSData *content =[@"Test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    
    //Create file
    NSURLSessionTask *task = [[self.Client getfiles] addEntity:itemToAdd callback:^(MSSharePointItem *addedItem, MSODataException *error) {
        //Put content to file
        [[[[[self.Client getfiles]getById:addedItem.id] asFile] putContent:content callback:^(NSInteger putContentResult, MSODataException *error) {
            //Get file content
            [[[[[self.Client getfiles]getById:addedItem.id] asFile] getContentWithCallback:^(NSData *addedContent, MSODataException *error) {
                BOOL passed = false;
                
                Test *test = [Test alloc];
                test.ExecutionMessages = [NSMutableArray array];
                
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
                
                test.Passed = passed;
                [test.ExecutionMessages addObject:message];
                
                //Cleanup
                if (addedItem != nil) {
                    
                    [[[[[self.Client getfiles]getById:addedItem.id] addCustomHeaderWithName:@"If-Match" value:@"*"]
                      deleteWithCallback:^(int status, MSODataException *error) {
                        
                          if(error!= nil)
                            NSLog(@"Error: %@", error);
                    
                      }]resume];
                }
                
                result(test);
                
            }]resume];
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestCreateFileWithStreamContent:(void (^) (Test*))result {
    
    MSSharePointItem *itemToAdd = [self GetFileItem];
    NSData *content =[@"Test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    
    //Create file
    NSURLSessionTask *task = [[self.Client getfiles] addEntity:itemToAdd callback:^(MSSharePointItem *addedItem, MSODataException *error) {
        //Put content to file
        NSInputStream *streamContent = [[NSInputStream alloc] initWithData:content];
        NSInteger size = content.length;
        
        [[[[[self.Client getfiles]getById:addedItem.id]asFile] putContent:streamContent withSize:size callback:^(NSInteger response, MSODataException *error) {
            //Get file content
            [[[[[self.Client getfiles]getById:addedItem.id] asFile ] getContentWithCallback:^(NSData *addedContent, MSODataException *error) {
                BOOL passed = false;
                
                Test *test = [Test alloc];
                test.ExecutionMessages = [NSMutableArray array];
                
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
                
                test.Passed = passed;
                [test.ExecutionMessages addObject:message];
                
                //Cleanup
                if (addedItem!= nil) {
                    
                    [[[[[self.Client getfiles]getById:addedItem.id] addCustomHeaderWithName:@"If-Match" value:@"*"] deleteWithCallback:^(int status, MSODataException *error) {
                        
                        if (error!= nil)
                            NSLog(@"Error: %@", error);
                    
                    }]resume];
                }
                
                result(test);
                
            }]resume];
        }]resume];
    }];
    
    return task;
}


-(NSURLSessionTask*)TestUpdateFileContent:(void (^) (Test*))result {
    
    MSSharePointItem *itemToAdd = [self GetFileItem];
    NSData *content =[@"Test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    NSData *updatedContent = [@"Updated test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    
    //Create file
    NSURLSessionTask *task = [[self.Client getfiles] addEntity:itemToAdd callback:^(MSSharePointItem *addedItem, MSODataException *error) {
        //Put content to file
        [[[[[self.Client getfiles]getById:addedItem.id]asFile] putContent:content callback:^(NSInteger putContentResult, MSODataException *error) {
            [[[[[self.Client getfiles]getById:addedItem.id]asFile] putContent:updatedContent
                                                                     callback:^(NSInteger updatedContentResult, MSODataException *error) {
                
                //Get file content
                [[[[[self.Client getfiles]getById:addedItem.id] asFile ] getContentWithCallback:^(NSData *newContent, MSODataException *error) {
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    test.ExecutionMessages = [NSMutableArray array];
                    
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
                    
                    test.Passed = passed;
                    [test.ExecutionMessages addObject:message];
                    
                    //Cleanup
                    if (addedItem!= nil) {
                        
                        [[[[[self.Client getfiles]getById:addedItem.id] addCustomHeaderWithName:@"If-Match" value:@"*"]
                          deleteWithCallback:^(int status, MSODataException *error) {
                              
                            if (error!= nil)
                                NSLog(@"Error: %@", error);
                              
                        }]resume];
                    }
                    
                    result(test);
                    
                }]resume];
                
            }]resume];
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetDrive:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[self.Client getdrive] readWithCallback:^(MSSharePointDrive *drive, MSODataException *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
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
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestTopFiles:(void (^) (Test*))result{
    
    MSSharePointItem *itemToAdd = [self GetFileItem];
    MSSharePointItem *itemToAdd2 = [self GetFileItem];
    
    // Add new item
    NSURLSessionTask *task = [[self.Client getfiles] addEntity:itemToAdd callback:^(MSSharePointItem *addedItem, MSODataException *e) {
        //Add second item
        [[[self.Client getfiles] addEntity:itemToAdd2 callback:^(MSSharePointItem *addedItem2, MSODataException *e) {
            //Get top 1 item
            [[[[self.Client getfiles] top:1]readWithCallback:^(NSArray<MSSharePointItem> *items, MSODataException *error) {
                BOOL passed = false;
                
                Test *test = [Test alloc];
                test.ExecutionMessages = [NSMutableArray array];
                
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
                
                test.Passed = passed;
                [test.ExecutionMessages addObject:message];
                
                //cleanup
                if (addedItem!= nil) {
                    [[[[[self.Client getfiles]getById:addedItem.id]addCustomHeaderWithName:@"If-Match" value:@"*"]deleteWithCallback:^(int status, MSODataException *error) {
                        
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    
                    }] resume];
                }
                
                if(addedItem2!= nil)
                    [[[[[self.Client getfiles]getById:addedItem2.id] addCustomHeaderWithName:@"If-Match"
                                                                                       value:@"*"]deleteWithCallback:^(int status, MSODataException *error) {
                        
                        if (error!= nil)
                            NSLog(@"Error: %@", error);
                    
                    }]resume];
                
                result(test);
            }] resume];
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestSelectFiles:(void (^) (Test*))result{
    
    MSSharePointItem *itemToAdd = [self GetFileItem];
    // Add new item
    NSURLSessionTask *task = [[self.Client getfiles] addEntity:itemToAdd callback:^(MSSharePointItem *addedItem, MSODataException *e) {
        //Get item
        [[[[[self.Client getfiles] select:@"name,dateTimeCreated"] top:1] readWithCallback:^(NSArray<MSSharePointItem> *items, MSODataException *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = @"";
            
            MSSharePointItem *selectedItem = nil;
            
            if(items.count > 0){
                selectedItem =(MSSharePointItem *)[items objectAtIndex:0];
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
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            //cleanup
            if (addedItem!= nil) {
                
                [[[[[self.Client getfiles]getById:addedItem.id] addCustomHeaderWithName:@"If-Match" value:@"*"] deleteWithCallback:^(int status, MSODataException *error) {
                   
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                
                }]resume];
            }
            
            result(test);
        }]resume];
    }];
    
    return task;
}


-(NSURLSessionTask*)TestDeleteFile:(void (^) (Test*))result{
    
    MSSharePointItem *itemToAdd = [self GetFileItem];
    // Add new item
    NSURLSessionTask *task = [[self.Client getfiles] addEntity:itemToAdd callback:^(MSSharePointItem *addedItem, MSODataException *e) {
        //Delete item
        
        [[[[[self.Client getfiles] getById:addedItem.id] addCustomHeaderWithName:@"If-Match" value:@"*"] deleteWithCallback:^(int status, MSODataException *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            
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
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(MSSharePointItem *)GetFileItem {
    
    NSString *fileName = [[[NSUUID UUID] UUIDString] stringByAppendingString:@".txt"];
    MSSharePointItem *item = [[MSSharePointItem alloc] init];

    [item setType:@"File"];
    [item setName:fileName];
    return item;
}

@end