/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "FilesTestRunner.h"

@implementation FilesTestRunner
-(id)initWithClient : (MSSharePointClient*)client{
    self.Client = client;
    return self;
}

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (id test))result{
    
    if([testName isEqualToString: @"TestGetFiles"]) return [self TestGetFiles:result];
    if([testName isEqualToString: @"TestGetFileById"]) return [self TestGetFileById:result];
    if([testName isEqualToString: @"TestCreateFileWithContent"]) return [self TestCreateFileWithContent:result];
    if([testName isEqualToString: @"TestUpdateFileContent"]) return [self TestUpdateFileContent:result];
    if([testName isEqualToString: @"TestGetDrive"]) return [self TestGetDrive:result];
    if([testName isEqualToString: @"TestTopFiles"]) return [self TestTopFiles:result];
    if([testName isEqualToString: @"TestSelectFiles"]) return [self TestTopFiles:result];
    
    return nil;
}

-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self :@"TestGetFiles" :@"Get Files" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetFileById" :@"Get File By Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateFileWithContent" :@"Create Files with content"]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateFileContent" :@"Update files content" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetDrive" :@"Get drive" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestTopFiles" :@"Top Files" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSelectFiles" :@"Select Files" ]];
    return array;
}


-(NSURLSessionDataTask*)TestGetFiles:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self.Client getfiles] read:^(NSArray<MSSharePointItem> *items, NSError *error) {
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


-(NSURLSessionDataTask*)TestGetFileById:(void (^) (Test*))result{
    MSSharePointItem *itemToAdd = [self GetFileItem];
    // Add new item
    NSURLSessionDataTask *task = [[self.Client getfiles] add:itemToAdd :^(MSSharePointItem *addedItem, NSError *e) {
        //Get item
        [[[[self.Client getfiles] getById:addedItem.id]read:^(MSSharePointItem *item, NSError *error) {
            
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
                [[[[self.Client getfiles]getById:addedItem.id]delete:^(int status, NSError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }]resume];
            
            
            result(test);
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCreateFileWithContent:(void (^) (Test*))result{
    MSSharePointItem *itemToAdd = [self GetFileItem];
    NSData *content =[@"Test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    
    //Create file
    NSURLSessionDataTask *task = [[self.Client getfiles] add:itemToAdd :^(MSSharePointItem *addedItem, NSError *error) {
        //Put content to file
        [[[[[self.Client getfiles]getById:addedItem.id]asFile] putContent:content withCallback:^(NSInteger putContentResult, NSError *error) {
            //Get file content
            [[[[[self.Client getfiles]getById:addedItem.id] asFile ] getContentWithCallback:^(NSData *addedContent, NSError *error) {
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
                if(addedItem!= nil)
                    [[[[self.Client getfiles]getById:addedItem.id]delete:^(int status, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
                
            }]resume];
        }]resume];
        }];
    
    return task;
}


-(NSURLSessionDataTask*)TestUpdateFileContent:(void (^) (Test*))result{
    MSSharePointItem *itemToAdd = [self GetFileItem];
    NSData *content =[@"Test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    NSData *updatedContent = [@"Updated test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    
    //Create file
    NSURLSessionDataTask *task = [[self.Client getfiles] add:itemToAdd :^(MSSharePointItem *addedItem, NSError *error) {
        //Put content to file
        [[[[[self.Client getfiles]getById:addedItem.id]asFile] putContent:content withCallback:^(NSInteger putContentResult, NSError *error) {
            [[[[[self.Client getfiles]getById:addedItem.id]asFile] putContent:updatedContent withCallback:^(NSInteger updatedContentResult, NSError *error) {
                
                //Get file content
                [[[[[self.Client getfiles]getById:addedItem.id] asFile ] getContentWithCallback:^(NSData *newContent, NSError *error) {
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
                    if(addedItem!= nil)
                        [[[[self.Client getfiles]getById:addedItem.id]delete:^(int status, NSError *error) {
                            if(error!= nil)
                                NSLog(@"Error: %@", error);
                        }]resume];
                    
                    result(test);
                    
                }]resume];
                
            }]resume];
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetDrive:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self.Client getdrive] read:^(MSSharePointDrive *drive, NSError *error) {
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

-(NSURLSessionDataTask*)TestTopFiles:(void (^) (Test*))result{
    MSSharePointItem *itemToAdd = [self GetFileItem];
    MSSharePointItem *itemToAdd2 = [self GetFileItem];
    // Add new item
    NSURLSessionDataTask *task = [[self.Client getfiles] add:itemToAdd :^(MSSharePointItem *addedItem, NSError *e) {
        //Add second item
        [[[self.Client getfiles] add:itemToAdd2 :^(MSSharePointItem *addedItem2, NSError *e) {
            //Get top 1 item
            [[[[self.Client getfiles] top:1]read:^(NSArray<MSSharePointItem> *items, NSError *error) {
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
                if(addedItem!= nil)
                    [[[[self.Client getfiles]getById:addedItem.id]delete:^(int status, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                if(addedItem2!= nil)
                    [[[[self.Client getfiles]getById:addedItem2.id]delete:^(int status, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }] resume];
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestSelectFiles:(void (^) (Test*))result{
    MSSharePointItem *itemToAdd = [self GetFileItem];
    // Add new item
    NSURLSessionDataTask *task = [[self.Client getfiles] add:itemToAdd :^(MSSharePointItem *addedItem, NSError *e) {
        //Get item
        [[[[self.Client getfiles] select:@"name,dateTimeCreated"]read:^(NSArray<MSSharePointItem> *items, NSError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = @"";
            
            MSSharePointItem *selectedItem = nil;
            if(items.count > 0){
                selectedItem =(MSSharePointItem*)[items objectAtIndex:0];
            }
            
            if(error == nil && selectedItem != nil && [selectedItem.name isEqualToString:addedItem.name] && selectedItem.dateTimeLastModified == nil ){
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
                [[[[self.Client getfiles]getById:addedItem.id]delete:^(int status, NSError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }]resume];
            
            
            result(test);
        }]resume];
    }];
    
    return task;
}


-(MSSharePointItem *) GetFileItem{
    NSString *fileName = [[[NSUUID UUID] UUIDString] stringByAppendingString:@".txt"];
    MSSharePointItem *item = [[MSSharePointItem alloc] init];
    [item setType:@"File"];
    [item setName:fileName];
    return item;
}
@end
