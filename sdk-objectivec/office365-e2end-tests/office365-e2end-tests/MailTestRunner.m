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
    
    if([testName isEqualToString: @"TestGetUser"]) return [self TestGetUser:result];
    
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
    
    /*
     
     this.addTest(canCreateMessageAttachment("Can create message with attachment", false));
     this.addTest(canSendMessage("Can send message", true));
     this.addTest(canCreateReplyMessage("Can create reply", true));
     this.addTest(canCreateReplyAllMessage("Can create reply all", true));
     this.addTest(canCreateForwardMessage("Can create forward", true));
     */
    
    // Folder tests
    if([testName isEqualToString:@"TestGetFolders"])return [self TestGetFolders:result];
    if([testName isEqualToString:@"TestGetFoldersById"])return [self TestGetFoldersById:result];
    if([testName isEqualToString:@"TestCreateFolder"])return [self TestCreateFolder:result];
    if([testName isEqualToString:@"TestDeleteFolder"])return [self TestDeleteFolder:result];
    if([testName isEqualToString:@"TestMoveFolder"])return [self TestMoveFolder:result];
    if([testName isEqualToString:@"TestCopyFolder"])return [self TestCopyFolder:result];
    if([testName isEqualToString:@"TestUpdateFolder"])return [self TestUpdateFolder:result];

    // Calendar tests
    /*
     //Calendar groups
     this.addTest(canCreateCalendarGroup("Can create calendar group", true));
     this.addTest(canGetCalendarGroups("Can get calendar groups", true));
     this.addTest(canGetCalendarGroupById("Can get calendar group by id", true));
     this.addTest(canUpdateCalendarGroup("Can update calendar group", true));
     this.addTest(canDeleteCalendarGroup("Can delete calendar group", true));
     
     // Calendars
     this.addTest(canCreateCalendar("Can create calendar", true));
     this.addTest(canGetCalendars("Can get calendars", true));
     this.addTest(canGetDefaultCalendar("Can get default calendar", true));
     this.addTest(canGetCalendarById("Can get calendar by id", true));
     this.addTest(canUpdateCalendar("Can update calendar", true));
     this.addTest(canDeleteCalendar("Can delete calendar", true));
     
     //Events
     this.addTest(canGetEvents("Can get events", true));
     this.addTest(canCreateEvents("Can create events", true));
     this.addTest(canUpdateEvents("Can update events", true));
     this.addTest(canDeleteEvents("Can delete events", true));
     
     */
    
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
    
    // Contacts Tests
    [array addObject:[[Test alloc] initWithData:self :@"TestGetContactFolder" :@"Get contacts folder" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetContacts" :@"Get contacts" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateContacts" :@"Create contacts" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteContacts" :@"Delete contacts" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateContacts" :@"Update contacts" ]];
    
    return array;
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

-(NSURLSessionDataTask*)TestCopyMessages:(void (^) (Test*))result{
    MSOMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    //Create message
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] add:newMessage :^(MSOMessage *addedMessage, NSError *error) {
        //Move message
        [[[[[[self.Client getMe]getMessages]getById:addedMessage.Id]getOperations]copy:@"Inbox" :^(MSOMessage *copiedMessage, NSError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = error == nil ? @"Ok - ": @"Not - ";
            
            if(copiedMessage!= nil && [copiedMessage.Subject isEqualToString:newMessage.Subject]){
                passed = true;
            }
            
            test.Passed = passed;
            
            [test.ExecutionMessages addObject:message];
            
            //Cleanup
            if(copiedMessage!= nil){
                [[[[[self.Client getMe]getMessages]getById:copiedMessage.Id]delete:^(id entity, NSError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }]resume];
            }
            
            [[[[[self.Client getMe]getMessages]getById:addedMessage.Id]delete:^(id entity, NSError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            
            result(test);
        }] resume];
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

//*************




@end