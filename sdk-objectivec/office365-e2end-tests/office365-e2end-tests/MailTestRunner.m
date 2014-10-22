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
#import <office365_exchange_sdk/MSOFolderCollectionFetcher.h>
#import <office365_exchange_sdk/MSOMessageCollectionFetcher.h>
#import <office365_exchange_sdk/MSOContactFolderCollectionFetcher.h>
#import <office365_exchange_sdk/MSOContactCollectionFetcher.h>
#import <office365_exchange_sdk/MSOCalendarGroupCollectionFetcher.h>
#import <office365_exchange_sdk/MSOCalendarCollectionFetcher.h>
#import <office365_exchange_sdk/MSOEventCollectionFetcher.h>
#import <office365_exchange_sdk/MSOContactFetcher.h>
#import <office365_exchange_sdk/MSOFolderFetcher.h>

@implementation MailTestRunner

-(id)initWithClient : (MSOEntityContainerClient*)client{
    self.Client = client;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString* mail = [userDefaults objectForKey: @"TestMail"];
    self.TestMail = mail == nil ? @"":mail ;
    
    return self;
}

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *test))result{
    
    //General
    if([testName isEqualToString: @"TestGetUser"]) return [self TestGetUser:result];
    if([testName isEqualToString: @"TestTop"]) return [self TestTop:result];
    if([testName isEqualToString: @"TestFilterWithTop"]) return [self TestFilterWithTop:result];
    if([testName isEqualToString: @"TestSelect"]) return [self TestSelect:result];
    
    // Contacts Tests
    if([testName isEqualToString:@"TestGetContactFolder"]) return [self TestGetContactFolder:result];
    if([testName isEqualToString:@"TestGetContacts"]) return [self TestGetContacts:result];
    if([testName isEqualToString:@"TestCreateContacts"]) return [self TestCreateContacts:result];
    if([testName isEqualToString:@"TestDeleteContacts"]) return [self TestDeleteContacts:result];
    if([testName isEqualToString:@"TestUpdateContacts"]) return [self TestUpdateContacts:result];
    
    
    //Mail Tests
    if([testName isEqualToString:@"TestGetMessages"]) return [self TestGetMessages:result];
    if([testName isEqualToString:@"TestCreateMessages"])return [self TestCreateMessages:result];
    if([testName isEqualToString:@"TestUpdateMessages"])return [self TestUpdateMessages:result];
    if([testName isEqualToString:@"TestDeleteMessages"])return [self TestDeleteMessages:result];
    if([testName isEqualToString:@"TestMoveMessages"])return [self TestMoveMessages:result];
    if([testName isEqualToString:@"TestCopyMessages"])return [self TestMoveMessages:result];
    if([testName isEqualToString:@"TestSendMessages"])return [self TestSendMessages:result];
    if([testName isEqualToString:@"TestReplyMessages"])return [self TestReplyMessages:result];
    if([testName isEqualToString:@"TestReplyAllMessages"])return [self TestReplyAllMessages:result];
    if([testName isEqualToString:@"TestForwardMessages"])return [self TestForwardMessages:result];
    
    // Folder tests
    if([testName isEqualToString:@"TestGetFolders"])return [self TestGetFolders:result];
    if([testName isEqualToString:@"TestGetFoldersById"])return [self TestGetFoldersById:result];
    if([testName isEqualToString:@"TestCreateFolder"])return [self TestCreateFolder:result];
    if([testName isEqualToString:@"TestDeleteFolder"])return [self TestDeleteFolder:result];
    if([testName isEqualToString:@"TestMoveFolder"])return [self TestMoveFolder:result];
    if([testName isEqualToString:@"TestCopyFolder"])return [self TestCopyFolder:result];
    if([testName isEqualToString:@"TestUpdateFolder"])return [self TestUpdateFolder:result];
    
    //Calendar groups Tests
    if([testName isEqualToString:@"TestGetCalendarGroups"])return [self TestGetCalendarGroups:result];
    if([testName isEqualToString:@"TestCreateCalendarGroups"])return [self TestCreateCalendarGroups:result];
    if([testName isEqualToString:@"TestGetCalendarGroupById"])return [self TestGetCalendarGroupById:result];
    if([testName isEqualToString:@"TestUpdateCalendarGroups"])return [self TestUpdateCalendarGroups:result];
    if([testName isEqualToString:@"TestDeleteCalendarGroups"])return [self TestDeleteCalendarGroups:result];
    
    // Calendar Tests
    if([testName isEqualToString:@"TestGetCalendars"])return [self TestGetCalendars:result];
    if([testName isEqualToString:@"TestGetDefaultCalendar"])return [self TestGetDefaultCalendar:result];
    if([testName isEqualToString:@"TestCreateCalendar"])return [self TestCreateCalendar:result];
    if([testName isEqualToString:@"TestGetCalendarById"])return [self TestGetCalendarById:result];
    if([testName isEqualToString:@"TestUpdateCalendar"])return [self TestUpdateCalendar:result];
    if([testName isEqualToString:@"TestDeleteCalendar"])return [self TestDeleteCalendar:result];
    
    //Events Tests
    
    if([testName isEqualToString:@"TestGetEvents"])return [self TestGetEvents:result];
    if([testName isEqualToString:@"TestCreateEvents"])return [self TestCreateEvents:result];
    if([testName isEqualToString:@"TestUpdateEvents"])return [self TestUpdateEvents:result];
    if([testName isEqualToString:@"TestDeleteEvents"])return [self TestDeleteEvents:result];
    
    
    
    /*
     else{
     return [self TestDefaultWithCompletionHandler:result];
     }
     */
    
    return nil;
}

-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUser" :@"Get User" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestTop" :@"Can use top" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestFilterWithTop" :@"Can use filter with top" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSelect" :@"Can use select with top" ]];
    
    
    //Folder tests
    [array addObject:[[Test alloc] initWithData:self :@"TestGetFolders" :@"Get Folders" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetFoldersById" :@"Get Folders by Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateFolder" :@"Create Folder" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteFolder" :@"Delete Folders" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestMoveFolder" :@"Move Folders" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCopyFolder" :@"Copy Folders" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateFolder" :@"Update Folders" ]];
    
    
    //Messages Tests
    [array addObject:[[Test alloc] initWithData:self :@"TestGetMessages" :@"Get Messages" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateMessages" :@"Create message in drafts" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateMessages" :@"Update message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteMessages" :@"Delete message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestMoveMessages" :@"Move message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCopyMessages" :@"Copy message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSendMessages" :@"Send message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestReplyMessages" :@"Reply message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestReplyAllMessages" :@"ReplyAll message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestForwardMessages" :@"Forward message" ]];
    
    // Contacts Tests
    [array addObject:[[Test alloc] initWithData:self :@"TestGetContactFolder" :@"Get contacts folder" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetContacts" :@"Get contacts" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateContacts" :@"Create contacts" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteContacts" :@"Delete contacts" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateContacts" :@"Update contacts" ]];
    
    // Calendar Groups Tests
    [array addObject:[[Test alloc] initWithData:self :@"TestGetCalendarGroups" :@"Get calendar groups" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateCalendarGroups" :@"Create calendar groups" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetCalendarGroupById" :@"Get calendar groups by id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateCalendarGroups" :@"Update calendar groups" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteCalendarGroups" :@"Delete calendar groups" ]];
    
    // Calendar Tests
    [array addObject:[[Test alloc] initWithData:self :@"TestGetCalendars" :@"Get calendars" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetDefaultCalendar" :@"Get default calendar" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateCalendar" :@"Create calendar" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetCalendarById" :@"Get calendar by id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateCalendar" :@"Update calendar" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteCalendar" :@"Delete calendar" ]];
    
    //Event Tests
    [array addObject:[[Test alloc] initWithData:self :@"TestGetEvents" :@"Get events" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateEvents" :@"Create event" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateEvents" :@"Update event" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteEvents" :@"Delete event" ]];
    
    return array;
}

// ****** General Tests *******

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

-(NSURLSessionDataTask*)TestTop:(void (^) (Test*))result{
    MSOMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] add:newMessage :^(MSOMessage *addedMessage, NSError *error) {
        [[[[self.Client getMe] getMessages] add:newMessage :^(MSOMessage *addedMessage2, NSError *e) {
            
            [[[[[self.Client getMe]getMessages]top:1]execute:^(NSArray<MSOMessage> *messages, NSError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.ExecutionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                
                if(error==nil && messages!= nil && [messages count] == 1){
                    passed = true;
                    message =@"Ok - ";
                }
                else{
                    message = @"Not - ";
                    if(error != nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.Passed = passed;
                [test.ExecutionMessages addObject:message];
                
                if(addedMessage!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage.Id]delete:^(id entity, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                if(addedMessage2!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage2.Id]delete:^(id entity, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }]resume];
            
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestFilterWithTop:(void (^) (Test*))result{
    MSOMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] add:newMessage :^(MSOMessage *addedMessage, NSError *error) {
        [[[[self.Client getMe] getMessages] add:newMessage :^(MSOMessage *addedMessage2, NSError *e) {
            
            [[[[[[self.Client getMe]getMessages]filter:@"Subject eq 'My Subject'"]top:1]execute:^(NSArray<MSOMessage> *messages, NSError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.ExecutionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                
                if(error==nil && messages!= nil && [messages count] == 1){
                    passed = true;
                    message =@"Ok - ";
                }
                else{
                    message = @"Not - ";
                    if(error != nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.Passed = passed;
                [test.ExecutionMessages addObject:message];
                
                if(addedMessage!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage.Id]delete:^(id entity, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                if(addedMessage2!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage2.Id]delete:^(id entity, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }]resume];
            
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestSelect:(void (^) (Test*))result{
    MSOMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] add:newMessage :^(MSOMessage *addedMessage, NSError *error) {
        [[[[self.Client getMe] getMessages] add:newMessage :^(MSOMessage *addedMessage2, NSError *e) {
            
            [[[[[[self.Client getMe]getMessages]select:@"Subject"]top:1] execute:^(NSArray<MSOMessage> *messages, NSError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.ExecutionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                MSOMessage *current =(messages!= nil && [messages count] == 1) ?[messages objectAtIndex:0] : nil;
                
                if(error==nil && messages!= nil && [messages count] == 1 && current.DateTimeReceived == nil){
                    passed = true;
                    message =@"Ok - ";
                }
                else{
                    message = @"Not - ";
                    if(error != nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.Passed = passed;
                [test.ExecutionMessages addObject:message];
                
                if(addedMessage!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage.Id]delete:^(id entity, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                if(addedMessage2!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage2.Id]delete:^(id entity, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }]resume];
            
        }]resume];
    }];
    
    return task;
}


//******* Folder Tests **********

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

-(NSURLSessionDataTask*)TestGetFoldersById:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[[self.Client getMe] getFolders] getById:@"Inbox"] execute:^(MSOFolder *folder, NSError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = (error!=nil && folder!= nil)  ? @"Ok - ": @"Not - ";
        [test.ExecutionMessages addObject:message];
        
        if(error != nil){
            [test.ExecutionMessages addObject: [error localizedDescription]];
        }
        
        if(folder != nil){
            passed = true;
        }
        
        test.Passed = passed;
        
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
        
        if(e== nil && [newFolder.DisplayName isEqualToString:folderName] ){
            message = @"Ok - ";
            passed = true;
        }else
        {
            message = @"Not - ";
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestDeleteFolder:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOFolder *newFolder = [[MSOFolder alloc] init];
    [newFolder setDisplayName:folderName];
    
    //Create folder
    NSURLSessionDataTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] add:newFolder:^(MSOFolder *folder, NSError *e) {
        [[[[[self.Client getMe] getFolders] getById:newFolder.Id] delete:^(id entity, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = [@"Not - " stringByAppendingString:[error localizedDescription]];
            }
            
            
            [test.ExecutionMessages addObject:message];
            test.Passed = passed;
            result(test);
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestMoveFolder:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOFolder *newFolder = [[MSOFolder alloc] init];
    [newFolder setDisplayName:folderName];
    
    NSURLSessionDataTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] add:newFolder:^(MSOFolder *addedFolder, NSError *e) {
        [[[[[[self.Client getMe] getFolders]getById:addedFolder.Id] getOperations] move:@"Drafts" :^(MSOFolder *folder, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(error== nil && folder!=nil ){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = @"Not - ";
                if(error!= nil){
                    message = [message stringByAppendingString:[error localizedDescription]];
                }
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            //Cleanup
            if(folder!= nil)
                [[[[[self.Client getMe]getFolders]getById:folder.Id]delete:^(id entity, NSError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }] resume];
            
            result(test);
            
        }] resume];
        
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCopyFolder:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOFolder *newFolder = [[MSOFolder alloc] init];
    [newFolder setDisplayName:folderName];
    
    NSURLSessionDataTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] add:newFolder:^(MSOFolder *addedFolder, NSError *e) {
        [[[[[[self.Client getMe] getFolders]getById:addedFolder.Id] getOperations] copy:@"Drafts" :^(MSOFolder *copiedFolder, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(error== nil && copiedFolder!=nil ){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = @"Not - ";
                if(error!= nil){
                    message = [message stringByAppendingString:[error localizedDescription]];
                }
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            //Cleanup
            if(copiedFolder!= nil)
            {
                [[[[[self.Client getMe]getFolders]getById:copiedFolder.Id]delete:^(id entity, NSError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }] resume];
            }
            
            [[[[[self.Client getMe]getFolders]getById:addedFolder.Id]delete:^(id entity, NSError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }] resume];
            
            result(test);
            
        }] resume];
        
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestUpdateFolder:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOFolder *newFolder = [[MSOFolder alloc] init];
    [newFolder setDisplayName:folderName];
    
    NSURLSessionDataTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] add:newFolder:^(MSOFolder *addedFolder, NSError *e) {
        NSString *updatedFolderName = [@"Updated" stringByAppendingString:folderName];
        [newFolder setDisplayName:updatedFolderName];
        [[[[[self.Client getMe]getFolders]getById:addedFolder.Id]update:newFolder :^(MSOFolder *updatedFolder, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && [updatedFolder.DisplayName isEqualToString:updatedFolderName] ){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = @"Not - ";
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

//******* Message Tests **********

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

-(NSURLSessionDataTask*)TestCreateMessages:(void (^) (Test*))result{
    MSOMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] add:newMessage :^(MSOMessage *addedMessage, NSError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = error == nil && addedMessage!= nil  ? @"Ok - ": @"Not - ";
        
        if(addedMessage!= nil && [addedMessage.Subject isEqualToString:newMessage.Subject]){
            passed = true;
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        if(addedMessage!= nil)
            [[[[[self.Client getMe]getMessages]getById:addedMessage.Id]delete:^(id entity, NSError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestUpdateMessages:(void (^) (Test*))result{
    MSOMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    //Create message
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] add:newMessage :^(MSOMessage *addedMessage, NSError *error) {
        NSString *updatedSubject = @"My Updated Subject";
        [newMessage setSubject:updatedSubject];
        //Update message
        [[[[[self.Client getMe]getMessages]getById:addedMessage.Id]update:newMessage :^(MSOMessage *updatedMessage, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = error == nil ? @"Ok - ": @"Not - ";
            
            if(updatedMessage!= nil && [updatedMessage.Subject isEqualToString:newMessage.Subject]){
                passed = true;
            }
            
            test.Passed = passed;
            
            [test.ExecutionMessages addObject:message];
            if(updatedMessage!= nil)
                [[[[[self.Client getMe]getMessages]getById:updatedMessage.Id]delete:^(id entity, NSError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestDeleteMessages:(void (^) (Test*))result{
    MSOMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] add:newMessage :^(MSOMessage *addedMessage, NSError *error) {
        [[[[[self.Client getMe] getMessages] getById:addedMessage.Id]delete:^(id entity, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = error == nil ? @"Ok - ": @"Not - ";
            
            if(error== nil){
                passed = true;
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestMoveMessages:(void (^) (Test*))result{
    MSOMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    //Create message
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] add:newMessage :^(MSOMessage *addedMessage, NSError *error) {
        //Move message
        [[[[[[self.Client getMe]getMessages]getById:addedMessage.Id]getOperations]move:@"Inbox" :^(MSOMessage *movedMessage, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = error == nil ? @"Ok - ": @"Not - ";
            
            if(movedMessage!= nil && [movedMessage.Subject isEqualToString:newMessage.Subject]){
                passed = true;
            }
            
            test.Passed = passed;
            
            [test.ExecutionMessages addObject:message];
            
            //Cleanup
            if(movedMessage!= nil)
                [[[[[self.Client getMe]getMessages]getById:movedMessage.Id]delete:^(id entity, NSError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestSendMessages:(void (^) (Test*))result{
    MSOMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    //Send Mail
    NSURLSessionDataTask* task = [[[self.Client getMe] getOperations] sendMail:newMessage :true :^(int returnValue, NSError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = @"";
        
        
        if(error== nil){
            message = @"Ok - ";
            passed = true;
        }else{
            message = [@"Not - " stringByAppendingString:[error localizedDescription]];
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestReplyMessages:(void (^) (Test*))result{
    
    NSURLSessionDataTask* task = [[[[self.Client getMe] getMessages] top:1] execute:^(NSArray<MSOMessage> *messages, NSError *error) {
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            test.Passed = false;
            [test.ExecutionMessages addObject:@"Not - No available mails to reply"];
            result(test);
        }else{
            MSOMessage *currentMessage = [messages objectAtIndex:0];
            [[[[[[self.Client getMe]getMessages]getById:currentMessage.Id]getOperations]createReply:^(MSOMessage *replyMessage, NSError *error) {
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.ExecutionMessages = [NSMutableArray array];
                NSString* message = @"";
                if(error == nil && replyMessage != nil){
                    message =@"Ok - ";
                    passed = true;
                }else{
                    message = @"Not - ";
                    if(error!=nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.Passed = passed;
                [test.ExecutionMessages addObject:message];
                
                //Cleanup
                if(replyMessage!= nil)
                    [[[[[self.Client getMe]getMessages]getById:replyMessage.Id]delete:^(id entity, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                
                result(test);
            }] resume];
        }
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestReplyAllMessages:(void (^) (Test*))result{
    
    NSURLSessionDataTask* task = [[[[self.Client getMe] getMessages] top:1] execute:^(NSArray<MSOMessage> *messages, NSError *error) {
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            test.Passed = false;
            [test.ExecutionMessages addObject:@"Not - No available mails to reply all"];
            result(test);
        }else{
            MSOMessage *currentMessage = [messages objectAtIndex:0];
            [[[[[[self.Client getMe]getMessages]getById:currentMessage.Id]getOperations]createReplyAll:^(MSOMessage *replyAllMessage, NSError *error) {
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.ExecutionMessages = [NSMutableArray array];
                NSString* message = @"";
                if(error == nil && replyAllMessage != nil){
                    message =@"Ok - ";
                    passed = true;
                }else{
                    message = @"Not - ";
                    if(error!=nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.Passed = passed;
                [test.ExecutionMessages addObject:message];
                
                //Cleanup
                if(replyAllMessage!= nil)
                    [[[[[self.Client getMe]getMessages]getById:replyAllMessage.Id]delete:^(id entity, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }] resume];
        }
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestForwardMessages:(void (^) (Test*))result{
    
    NSURLSessionDataTask* task = [[[[self.Client getMe] getMessages] top:1] execute:^(NSArray<MSOMessage> *messages, NSError *error) {
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            test.Passed = false;
            [test.ExecutionMessages addObject:@"Not - No available mails to reply all"];
            result(test);
        }else{
            MSOMessage *currentMessage = [messages objectAtIndex:0];
            [[[[[[self.Client getMe]getMessages]getById:currentMessage.Id]getOperations]createForward:^(MSOMessage *fwMessage, NSError *error) {
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.ExecutionMessages = [NSMutableArray array];
                NSString* message = @"";
                if(error == nil && fwMessage != nil){
                    message =@"Ok - ";
                    passed = true;
                }else{
                    message = @"Not - ";
                    if(error!=nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.Passed = passed;
                [test.ExecutionMessages addObject:message];
                
                //Cleanup
                if(fwMessage!= nil)
                    [[[[[self.Client getMe]getMessages]getById:fwMessage.Id]delete:^(id entity, NSError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }] resume];
        }
    }];
    
    return task;
}

-(MSOMessage*) getSampleMessage : (NSString*) subject  : (NSString*) to  : (NSString*) cc   {
    MSOMessage *message = [[MSOMessage alloc]init];
    //To recipient
    MSORecipient *toRecipient = [[MSORecipient alloc] init];
    MSOEmailAddress* email = [[MSOEmailAddress alloc]init];
    [email setAddress:to];
    [toRecipient setEmailAddress:email];
    
    NSMutableArray *toRecipients = [[NSMutableArray alloc]init];
    [toRecipients addObject:toRecipient];
    [message setToRecipients:toRecipients];
    
    //Cc recipient
    if(![cc isEqualToString:@""]){
        MSORecipient *ccRecipient = [[MSORecipient alloc] init];
        MSOEmailAddress* emailCc = [[MSOEmailAddress alloc]init];
        [emailCc setAddress:cc];
        [ccRecipient setEmailAddress:emailCc];
        NSMutableArray *ccRecipients = [[NSMutableArray alloc]init];
        [toRecipients addObject:ccRecipient];
        [message setToRecipients:ccRecipients];
    }
    
    //Body & Subject
    [message setSubject:subject];
    MSOItemBody *body = [[MSOItemBody alloc]init];
    [body setContent:@"This is the email body"];
    [message setBody:body];
    
    return message;
}

// ******* Contact Tests **********

-(NSURLSessionDataTask*)TestGetContactFolder:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[[[self.Client getMe] getContactFolders] getById: @"Contacts"] getContacts] execute:^(NSArray<MSOContact>*contacts, NSError *error) {
        BOOL passed = false;
        Test *test = [Test alloc];
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = (error != nil || contacts == nil) ? @"Not - " : @"Ok - ";
        [test.ExecutionMessages addObject:message];
        
        if(error != nil){
            [test.ExecutionMessages addObject: [error localizedDescription]];
        }
        
        if(contacts != nil){
            passed = true;
        }
        
        test.Passed = passed;
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetContacts:(void (^) (Test*))result{
    MSOContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionDataTask *task = [[[self.Client getMe] getContacts] add:newContact :^(MSOContact *addedContact, NSError *e) {
        //Get contacts
        [[[[self.Client getMe] getContacts] execute:^(NSArray<MSOContact>* contacts, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = (error!= nil || contacts == nil) ? @"Not - " : @"Ok - ";
            [test.ExecutionMessages addObject:message];
            
            if(error != nil){
                [test.ExecutionMessages addObject: [error localizedDescription]];
            }
            
            if(contacts != nil && [contacts count] != 0){
                passed = true;
            }
            
            test.Passed = passed;
            
            //Cleanup
            if(addedContact!= nil)
                [[[[[self.Client getMe] getContacts] getById:addedContact.Id] delete:^(id result, NSError * e) {
                    if(e!=nil)
                        NSLog(@"Error: %@", e);
                }] resume];
            
            result(test);
            
        }] resume];
        
    }];
    
    return task;
}


-(NSURLSessionDataTask*)TestCreateContacts:(void (^) (Test*))result{
    MSOContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionDataTask *task = [[[self.Client getMe] getContacts] add:newContact :^(MSOContact *addedContact, NSError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = (error!= nil || addedContact == nil) ? @"Not - " : @"Ok - ";
        [test.ExecutionMessages addObject:message];
        
        if(error != nil){
            [test.ExecutionMessages addObject: [error localizedDescription]];
        }
        
        if(addedContact != nil && [addedContact.DisplayName isEqualToString: newContact.DisplayName]){
            passed = true;
        }
        
        test.Passed = passed;
        
        //Cleanup
        if(addedContact!= nil)
            [[[[[self.Client getMe] getContacts] getById:addedContact.Id] delete:^(id result, NSError * error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }] resume];
        
        result(test);
        
    }];
    
    return task;
}


-(NSURLSessionDataTask*)TestDeleteContacts:(void (^) (Test*))result{
    MSOContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionDataTask *task = [[[self.Client getMe] getContacts] add:newContact :^(MSOContact *addedContact, NSError *e) {
        //Delete
        [[[[[self.Client getMe] getContacts] getById:addedContact.Id] delete:^(id deleteResult, NSError * error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = (error!= nil) ? @"Not - " : @"Ok - ";
            [test.ExecutionMessages addObject:message];
            
            if(error != nil){
                [test.ExecutionMessages addObject: [error localizedDescription]];
            }else{
                passed = true;
            }
            
            test.Passed = passed;
            result(test);
        }] resume];
        
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestUpdateContacts:(void (^) (Test*))result{
    MSOContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionDataTask *task = [[[self.Client getMe] getContacts] add:newContact :^(MSOContact *addedContact, NSError *error) {
        [newContact setDisplayName:@"New Contact Name"];
        
        [[[[[self.Client getMe]getContacts]getById:newContact.Id] update:newContact :^(MSOContact *updatedEntity, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = (error!= nil || updatedEntity == nil) ? @"Not - " : @"Ok - ";
            [test.ExecutionMessages addObject:message];
            
            if(error != nil){
                [test.ExecutionMessages addObject: [error localizedDescription]];
            }
            
            if(updatedEntity != nil && updatedEntity.DisplayName != addedContact.DisplayName){
                passed = true;
            }
            
            test.Passed = passed;
            
            //Cleanup
            if(updatedEntity!= nil)
                [[[[[self.Client getMe] getContacts] getById:updatedEntity.Id] delete:^(id result, NSError * error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }] resume];
            
            result(test);
        }] resume];
        
    }];
    
    return task;
}


-(MSOContact *) getContact{
    MSOContact* contact = [[MSOContact alloc]init];
    [contact setDisplayName:@"Test Contact"];
    [contact setGivenName:@"Test Contact Name"];
    
    MSOEmailAddress* email = [[MSOEmailAddress alloc]init];
    [email setAddress:@"test@test.com"];
    NSMutableArray *list = [[NSMutableArray alloc] init];
    [list addObject:email];
    
    [contact setEmailAddresses:list];
    return contact;
}

//******* Calendar Group Tests **********

-(NSURLSessionDataTask*)TestGetCalendarGroups:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[self.Client getMe] getCalendarGroups] execute:^(NSArray<MSOCalendarGroup> *calendarGroups, NSError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message =  @"";
        if(error == nil && calendarGroups != nil && [calendarGroups count]>0 ){
            message =  @"Ok - ";
            passed = true;
        }
        else{
            message =@"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString:[error localizedDescription]];
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        result(test);
    }];
    
    return task;
}


-(NSURLSessionDataTask*)TestCreateCalendarGroups:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    
    MSOCalendarGroup *newCalendarGroup = [[MSOCalendarGroup alloc] init];
    [newCalendarGroup setName:calendarGroupName];
    
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendarGroups] add:newCalendarGroup :^(MSOCalendarGroup *addedCalendarGroup, NSError *e) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if(e== nil && addedCalendarGroup != nil && [addedCalendarGroup.Name isEqualToString:calendarGroupName] ){
            message = @"Ok - ";
            passed = true;
        }else
        {
            message = @"Not - ";
            if(e != nil)
                message = [message stringByAppendingString:[e localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        //Cleanup
        [[[[[self.Client getMe]getCalendarGroups]getById:addedCalendarGroup.Id]delete:^(id entity, NSError *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }]resume];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetCalendarGroupById:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    
    MSOCalendarGroup *newCalendarGroup = [[MSOCalendarGroup alloc] init];
    [newCalendarGroup setName:calendarGroupName];
    //Create calendar group
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendarGroups] add:newCalendarGroup :^(MSOCalendarGroup *addedCalendarGroup, NSError *e) {
        //Get by id
        [[[[[self.Client getMe]getCalendarGroups]getById:addedCalendarGroup.Id]execute:^(MSOCalendarGroup *calendarGroup, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && calendarGroup != nil && [calendarGroup.Name isEqualToString:calendarGroupName] ){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = @"Not - ";
                if(e != nil)
                    message = [message stringByAppendingString:[e localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            //Cleanup
            [[[[[self.Client getMe]getCalendarGroups]getById:calendarGroup.Id]delete:^(id entity, NSError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestUpdateCalendarGroups:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    NSString *updatedCalendarGroupName = [@"Updated" stringByAppendingString:calendarGroupName];
    MSOCalendarGroup *newCalendarGroup = [[MSOCalendarGroup alloc] init];
    [newCalendarGroup setName:calendarGroupName];
    
    // Create Calendar
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendarGroups] add:newCalendarGroup :^(MSOCalendarGroup *addedCalendarGroup, NSError *e) {
        [newCalendarGroup setName:updatedCalendarGroupName];
        //Update Calendar Group
        [[[[[self.Client getMe] getCalendarGroups] getById:addedCalendarGroup.Id] update:newCalendarGroup :^(MSOCalendarGroup *updatedCalendarGroup, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && updatedCalendarGroup != nil && [updatedCalendarGroup.Name isEqualToString:updatedCalendarGroupName] ){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = @"Not - ";
                if(e != nil)
                    message = [message stringByAppendingString:[e localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            //Cleanup
            [[[[[self.Client getMe]getCalendarGroups]getById:updatedCalendarGroup.Id]delete:^(id entity, NSError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestDeleteCalendarGroups:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    
    MSOCalendarGroup *newCalendarGroup = [[MSOCalendarGroup alloc] init];
    [newCalendarGroup setName:calendarGroupName];
    //Create Calendar
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendarGroups] add:newCalendarGroup :^(MSOCalendarGroup *addedCalendarGroup, NSError *e) {
        //Delete Calendar
        [[[[[self.Client getMe]getCalendarGroups]getById:addedCalendarGroup.Id]delete:^(id entity, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil ){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = @"Not - ";
                if(e != nil)
                    message = [message stringByAppendingString:[e localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }]resume];
    }];
    
    return task;
}

// ****** Calendar Tests *****

-(NSURLSessionDataTask*)TestGetCalendars:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[self.Client getMe] getCalendars] execute:^(NSArray<MSOCalendar> *calendars, NSError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message =  @"";
        if(error == nil && calendars != nil && [calendars count]>0 ){
            message =  @"Ok - ";
            passed = true;
        }
        else{
            message =@"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString:[error localizedDescription]];
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetDefaultCalendar:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[self.Client getMe] getCalendar] execute:^(MSOCalendar *calendar, NSError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message =  @"";
        if(error == nil && calendar != nil ){
            message =  @"Ok - ";
            passed = true;
        }
        else{
            message =@"Not - ";
            if(error!= nil)
                message = [message stringByAppendingString:[error localizedDescription]];
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCreateCalendar:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    
    MSOCalendar *newCalendar = [[MSOCalendar alloc] init];
    [newCalendar setName:calendarName];
    
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendars] add:newCalendar :^(MSOCalendar *addedCalendar, NSError *e) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if(e== nil && addedCalendar != nil && [addedCalendar.Name isEqualToString:calendarName] ){
            message = @"Ok - ";
            passed = true;
        }else
        {
            message = @"Not - ";
            if(e != nil)
                message = [message stringByAppendingString:[e localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        //Cleanup
        [[[[[self.Client getMe]getCalendars]getById:addedCalendar.Id]delete:^(id entity, NSError *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }]resume];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetCalendarById:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    
    MSOCalendar *newCalendar = [[MSOCalendar alloc] init];
    [newCalendar setName:calendarName];
    //Create calendar
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendars] add:newCalendar :^(MSOCalendar *addedCalendar, NSError *e) {
        //Get by id
        [[[[[self.Client getMe]getCalendars]getById:addedCalendar.Id] execute:^(MSOCalendar *calendar, NSError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && calendar != nil && [calendar.Name isEqualToString:calendarName] ){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = @"Not - ";
                if(e != nil)
                    message = [message stringByAppendingString:[e localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            //Cleanup
            [[[[[self.Client getMe]getCalendars]getById:calendar.Id]delete:^(id entity, NSError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestUpdateCalendar:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    NSString *updatedCalendarName = [@"Updated" stringByAppendingString:calendarName];
    MSOCalendar *newCalendar = [[MSOCalendar alloc] init];
    [newCalendar setName:calendarName];
    
    // Create Calendar
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendars] add:newCalendar :^(MSOCalendar *addedCalendar, NSError *e) {
        [newCalendar setName:updatedCalendarName];
        //Update Calendar
        [[[[[self.Client getMe] getCalendars] getById:addedCalendar.Id] update:newCalendar :^(MSOCalendar *updatedCalendar, NSError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && updatedCalendar != nil && [updatedCalendar.Name isEqualToString:updatedCalendarName] ){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = @"Not - ";
                if(e != nil)
                    message = [message stringByAppendingString:[e localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            //Cleanup
            [[[[[self.Client getMe]getCalendars]getById:updatedCalendar.Id]delete:^(id entity, NSError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestDeleteCalendar:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    
    MSOCalendar *newCalendar = [[MSOCalendar alloc] init];
    [newCalendar setName:calendarName];
    //Create Calendar
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendars] add:newCalendar :^(MSOCalendar *addedCalendar, NSError *e) {
        
        //Delete Calendar
        [[[[[self.Client getMe]getCalendars]getById:addedCalendar.Id]delete:^(id entity, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil ){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = @"Not - ";
                if(e != nil)
                    message = [message stringByAppendingString:[e localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }]resume];
    }];
    
    return task;
}

// ****** Event Tests *****

-(NSURLSessionDataTask*)TestGetEvents:(void (^) (Test*))result{
    MSOEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionDataTask *task = [[[self.Client getMe] getEvents] add:event :^(MSOEvent *addedEvent, NSError *e) {
        //Get Events
        [[[[self.Client getMe]getEvents]execute:^(NSArray<MSOEvent> *events, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message =  @"";
            if(error == nil && events != nil && [events count]>0 ){
                message =  @"Ok - ";
                passed = true;
            }
            else{
                message =@"Not - ";
                if(error!= nil)
                    message = [message stringByAppendingString:[error localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            //Cleanup
            [[[[[self.Client getMe]getEvents]getById:addedEvent.Id]delete:^(id entity, NSError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        }] resume];
        
        
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCreateEvents:(void (^) (Test*))result{
    MSOEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionDataTask *task = [[[self.Client getMe] getEvents] add:event :^(MSOEvent *addedEvent, NSError *e) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message =  @"";
        if(e == nil && addedEvent != nil ){
            message =  @"Ok - ";
            passed = true;
        }
        else{
            message =@"Not - ";
            if(e!= nil)
                message = [message stringByAppendingString:[e localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        //Cleanup
        [[[[[self.Client getMe]getEvents]getById:addedEvent.Id]delete:^(id entity, NSError *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }]resume];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestUpdateEvents:(void (^) (Test*))result{
    MSOEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionDataTask *task = [[[self.Client getMe] getEvents] add:event :^(MSOEvent *addedEvent, NSError *e) {
        NSString *updatedSubject = [@"Updated" stringByAppendingString:event.Subject];
        [event setSubject:updatedSubject];
        // Update Event
        [[[[[self.Client getMe] getEvents] getById:addedEvent.Id]update:event :^(MSOEvent *updatedEvent, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message =  @"";
            if(error == nil && updatedEvent != nil && [updatedEvent.Subject isEqualToString:updatedSubject]){
                message =  @"Ok - ";
                passed = true;
            }
            else{
                message =@"Not - ";
                if(e!= nil)
                    message = [message stringByAppendingString:[e localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            //Cleanup
            [[[[[self.Client getMe]getEvents]getById:addedEvent.Id]delete:^(id entity, NSError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        } ]resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestDeleteEvents:(void (^) (Test*))result{
    MSOEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionDataTask *task = [[[self.Client getMe] getEvents] add:event :^(MSOEvent *addedEvent, NSError *e) {
        //Delete event
        [[[[[self.Client getMe]getEvents]getById:addedEvent.Id]delete:^(id entity, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message =  @"";
            if(error == nil ){
                message =  @"Ok - ";
                passed = true;
            }
            else{
                message =@"Not - ";
                if(e!= nil)
                    message = [message stringByAppendingString:[e localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
        }]resume];
        
    }];
    
    return task;
}


-(MSOEvent*) getSampleEvent{
    
    MSOEvent *event= [[MSOEvent alloc]init];
    [event setSubject:@"Today's appointment"];
    [event setStart:[NSDate date]];
    MSOImportance *importance = High;
    [event setImportance: importance];
    
    //Event Body
    MSOItemBody *itemBody = [[MSOItemBody alloc] init];
    [itemBody setContent:@"This is the appointment info"];
    MSOBodyType *bt = Text;
    [itemBody setContentType: bt];
    [event setBody:itemBody];
    
    // Attendees
    MSOAttendee *attendee1 = [[MSOAttendee alloc]init];
    MSOEmailAddress *email = [[MSOEmailAddress alloc]init];
    [email setAddress: self.TestMail];
    [attendee1 setEmailAddress:email];
    
    NSMutableArray *attendees = [[NSMutableArray alloc] init];
    [attendees addObject:attendee1];
    [event setAttendees:attendees];
    
    return event;
}

@end