/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MailTestRunner.h"
#import "TestParameters.h"
#import "Test.h"

@implementation MailTestRunner

- (id)initWithClient:(MSOutlookServicesClient *)client {
    
    self.Client = client;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *mail = [userDefaults objectForKey: @"TestMail"];
    
    self.TestMail = mail == nil ? @"":mail ;
    
    return self;
}

- (NSURLSessionTask *)Run:(NSString *)testName completionHandler:(void(^)(Test *test))result{
    
    //General
    if([testName isEqualToString: @"TestGetUser"]) return [self TestGetUser:result];
    if([testName isEqualToString: @"TestTop"]) return [self TestTop:result];
    if([testName isEqualToString: @"TestFilterWithTop"]) return [self TestFilterWithTop:result];
    if([testName isEqualToString: @"TestSelect"]) return [self TestSelect:result];
    if([testName isEqualToString: @"TestSkip"]) return [self TestSkip:result];
    if([testName isEqualToString: @"TestOrderBy"]) return [self TestOrderBy:result];
    if([testName isEqualToString: @"TestExpandLists"]) return [self TestExpandLists:result];
    if([testName isEqualToString: @"TestExpand"]) return [self TestExpand:result];
    
    
    // Contacts Tests
    if([testName isEqualToString:@"TestGetContactFolder"]) return [self TestGetContactFolder:result];
    if([testName isEqualToString:@"TestGetContacts"]) return [self TestGetContacts:result];
    if([testName isEqualToString:@"TestCreateContacts"]) return [self TestCreateContacts:result];
    if([testName isEqualToString:@"TestDeleteContacts"]) return [self TestDeleteContacts:result];
    if([testName isEqualToString:@"TestUpdateContacts"]) return [self TestUpdateContacts:result];
    
    //Mail Tests
    if([testName isEqualToString:@"TestGetMessages"]) return [self TestGetMessages:result];
    if([testName isEqualToString:@"TestGetMessagesOverload"])return [self TestGetMessageOverload:result];
    if([testName isEqualToString:@"TestCreateMessages"])return [self TestCreateMessages:result];
    if([testName isEqualToString:@"TestCreateHtmlMessages"])return [self TestCreateAndSendHtmlMessages:result];
    if([testName isEqualToString:@"TestCreateMessageWithAttachment"])return [self TestCreateMessageWithAttachment:result];
    if([testName isEqualToString:@"TestGetAttachment"])return [self TestGetAttachment:result];
    if([testName isEqualToString:@"TestUpdateMessages"])return [self TestUpdateMessages:result];
    if([testName isEqualToString:@"TestDeleteMessages"])return [self TestDeleteMessages:result];
    if([testName isEqualToString:@"TestMoveMessages"])return [self TestMoveMessages:result];
    if([testName isEqualToString:@"TestCopyMessages"])return [self TestMoveMessages:result];
    if([testName isEqualToString:@"TestSendMessages"])return [self TestSendMessages:result];
    if([testName isEqualToString:@"TestSendWithMessageOperations"])return [self TestSendWithMessageOperations:result];
    if([testName isEqualToString:@"TestSendHtmlMessages"])return [self TestSendHtmlMessages:result];
    if([testName isEqualToString:@"TestReplyMessages"])return [self TestReplyMessages:result];
    if([testName isEqualToString:@"TestReplyAllMessages"])return [self TestReplyAllMessages:result];
    if([testName isEqualToString:@"TestForwardMessages"])return [self TestForwardMessages:result];
    if([testName isEqualToString:@"TestReplyHtmlMessages"])return [self TestReplyHtmlMessages:result];
    
    // Folder tests
    if([testName isEqualToString:@"TestGetFolders"])return [self TestGetFolders:result];
    if([testName isEqualToString:@"TestGetFoldersById"])return [self TestGetFoldersById:result];
    if([testName isEqualToString:@"TestGetFoldersByIdOverload"])return [self TestGetFoldersByIdOverload:result];
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
    if([testName isEqualToString:@"TestGetCalendarView"])return [self TestGetCalendarView:result];
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

- (NSMutableArray *)getTests {
    
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUser" :@"Get User" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestTop" :@"Can use top" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestFilterWithTop" :@"Can use filter with top" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSelect" :@"Can use select with top" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSkip" :@"Can use skip" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestOrderBy" :@"Can use order by" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestExpandLists" :@"Can use expand in lists" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestExpand" :@"Can use expand" ]];
    
    //Folder tests
    [array addObject:[[Test alloc] initWithData:self :@"TestGetFolders" :@"Get Folders" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetFoldersById" :@"Get Folders by Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetFoldersByIdOverload" :@"Get Folders by Id (overload)" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateFolder" :@"Create Folder" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteFolder" :@"Delete Folders" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestMoveFolder" :@"Move Folders" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCopyFolder" :@"Copy Folders" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateFolder" :@"Update Folders" ]];
    
    
    //Messages Tests
    [array addObject:[[Test alloc] initWithData:self :@"TestGetMessages" :@"Get Messages" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetMessagesOverload" :@"Get Message (overload)" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateMessages" :@"Create message in drafts" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateHtmlMessages" :@"Create and Send Html message in drafts" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateMessages" :@"Update message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteMessages" :@"Delete message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestMoveMessages" :@"Move message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCopyMessages" :@"Copy message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSendMessages" :@"Send message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSendWithMessageOperations" :@"Send with message operations" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSendHtmlMessages" :@"Send Html message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestReplyMessages" :@"Reply message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestReplyAllMessages" :@"ReplyAll message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestForwardMessages" :@"Forward message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateMessageWithAttachment" :@"Create Message With Attachment" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetAttachment" :@"Get Attachment" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestReplyHtmlMessages" :@"Reply Html message" ]];
    
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
    [array addObject:[[Test alloc] initWithData:self :@"TestGetCalendarView" :@"Get calendar view" ]];
    
    //Event Tests
    [array addObject:[[Test alloc] initWithData:self :@"TestGetEvents" :@"Get events" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateEvents" :@"Create event" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateEvents" :@"Update event" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteEvents" :@"Delete event" ]];
    
    return array;
}

#pragma mark GeneralTests

- (NSURLSessionTask *)TestGetUser:(void (^)(Test *))result {
    
    NSURLSessionTask *task = [[self.Client getMe] readWithCallback:^(MSOutlookServicesUser *user, MSODataException *error) {
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

- (NSURLSessionTask *)TestTop:(void (^) (Test *))result {
    
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionTask *task = [[[self.Client getMe] getMessages] addMessage:newMessage
                                                                  callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        
        [[[[self.Client getMe] getMessages] addMessage:newMessage
                                              callback:^(MSOutlookServicesMessage *addedMessage2, MSODataException *e) {
            
            [[[[[[self.Client getMe]getFoldersById:@"Inbox"] getMessages]top:1]readWithCallback:^(NSArray<MSOutlookServicesMessage> *messages, MSODataException *error) {
                
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
                    [[[[[self.Client getMe]getMessages]getById:addedMessage.id]deleteMessage :^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                if(addedMessage2!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage2.id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }]resume];
            
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestFilterWithTop:(void (^) (Test*))result{
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        [[[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage2, MSODataException *e) {
            
            [[[[[[[[self.Client getMe] getFolders] getById:@"Drafts"]getMessages]filter:@"Subject eq 'My Subject'"]top:1]readWithCallback:^(NSArray<MSOutlookServicesMessage> *messages, MSODataException *error) {
                
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
                    [[[[[self.Client getMe]getMessages]getById:addedMessage.id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                if(addedMessage2!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage2.id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }]resume];
            
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestSelect:(void (^) (Test*))result{
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        [[[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage2, MSODataException *e) {
            
            [[[[[[self.Client getMe]getMessages]select:@"Subject"]top:1] readWithCallback:^(NSArray<MSOutlookServicesMessage> *messages, MSODataException *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.ExecutionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                MSOutlookServicesMessage *current =(messages!= nil && [messages count] == 1) ? [messages objectAtIndex:0] : nil;
                
                if(error==nil && messages!= nil && [messages count] == 1 && current.dateTimeReceived == nil){
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
                    [[[[[self.Client getMe]getMessages]getById:addedMessage.id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                if(addedMessage2!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage2.id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }]resume];
            
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestSkip:(void (^) (Test*))result{
    MSOutlookServicesContact* contact1 = [self getContact];
    NSString *contact1Name = [@"AA" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    contact1.displayName = contact1Name;
    
    MSOutlookServicesContact* contact2 = [self getContact];
    NSString *contact2Name = [@"BB" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    contact2.displayName = contact2Name;
    
    //Create contact1
    NSURLSessionTask *task = [[[self.Client getMe] getContacts] addContact:contact1 callback:^(MSOutlookServicesContact *addedContact1, MSODataException *error) {
        // Create contact2
        [[[[self.Client getMe]getContacts]addContact:contact2 callback:^(MSOutlookServicesContact *addedContact2, MSODataException *e) {
            //Test order by
            NSString *filter = [@"" stringByAppendingFormat:@"DisplayName eq '%@' or DisplayName eq '%@'", contact1Name, contact2Name ];
            
            
            [[[[[[[self.Client getMe] getContacts ] filter:filter] orderBy:@"DisplayName Desc"] skip:1] readWithCallback:^(NSArray<MSOutlookServicesContact> *contacts, MSODataException *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                test.ExecutionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                
                if(error == nil && [contacts count] == 1 && [[[contacts objectAtIndex:0] displayName] isEqualToString:contact1Name] ){
                    passed = true;
                }
                else
                {
                    message = @"Not - ";
                    if(error != nil){
                        [message stringByAppendingString: [error localizedDescription]];
                    }
                }
                
                [test.ExecutionMessages addObject:message];
                test.Passed = passed;
                
                //Cleanup
                if(addedContact1!= nil)
                    [[[[[self.Client getMe] getContacts] getById:addedContact1.id] deleteContact:^(int status, MSODataException * error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }] resume];
                
                if(addedContact2!= nil)
                    [[[[[self.Client getMe] getContacts] getById:addedContact2.id] deleteContact:^(int status, MSODataException * error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }] resume];
                result(test);
                
            }] resume];
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestOrderBy:(void (^) (Test*))result{
    MSOutlookServicesContact* contact1 = [self getContact];
    NSString *contact1Name = [@"AA" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    contact1.displayName = contact1Name;
    
    MSOutlookServicesContact* contact2 = [self getContact];
    NSString *contact2Name = [@"BB" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    contact2.displayName = contact2Name;
    
    //Create contact1
    NSURLSessionTask *task = [[[self.Client getMe] getContacts] addContact:contact1 callback:^(MSOutlookServicesContact *addedContact1, MSODataException *error) {
        // Create contact2
        [[[[self.Client getMe]getContacts]addContact:contact2 callback:^(MSOutlookServicesContact *addedContact2, MSODataException *e) {
            //Test order by
            NSString *filter = [@"" stringByAppendingFormat:@"DisplayName eq '%@' or DisplayName eq '%@'", contact1Name, contact2Name ];
            
            // Get contacts Desc
            [[[[[[self.Client getMe] getContacts ] filter:filter] orderBy:@"DisplayName Desc"] readWithCallback:^(NSArray<MSOutlookServicesContact> *contactsDesc, MSODataException *error) {
                //Get contacts Asc
                [[[[[[self.Client getMe] getContacts] filter:filter] orderBy:@"DisplayName Asc"] readWithCallback:^(NSArray<MSOutlookServicesContact> *contactsAsc, NSError *error) {
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    test.ExecutionMessages = [NSMutableArray array];
                    
                    NSString* message = @"";
                    
                    if(error == nil && [contactsAsc count] == 2 && [contactsDesc count] == 2 && [[[contactsAsc objectAtIndex:0] displayName] isEqualToString:contact1Name] && [[[contactsDesc objectAtIndex:0] displayName] isEqualToString:contact2Name]){
                        passed = true;
                    }
                    else
                    {
                        message = @"Not - ";
                        if(error != nil){
                            [message stringByAppendingString: [error localizedDescription]];
                        }
                    }
                    
                    [test.ExecutionMessages addObject:message];
                    test.Passed = passed;
                    
                    //Cleanup
                    if(addedContact1!= nil)
                        [[[[[self.Client getMe] getContacts] getById:addedContact1.id] deleteContact:^(int status, MSODataException * error) {
                            if(error!= nil)
                                NSLog(@"Error: %@", error);
                        }] resume];
                    
                    if(addedContact2!= nil)
                        [[[[[self.Client getMe] getContacts] getById:addedContact2.id] deleteContact:^(int status, MSODataException * error) {
                            if(error!= nil)
                                NSLog(@"Error: %@", error);
                        }] resume];
                    result(test);
                    
                }] resume];
            }] resume];
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestExpandLists:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *messageSubject = [@"Test Attachment" stringByAppendingString:uuid];
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:messageSubject : self.TestMail : @""];
    //Add message
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        
        MSOutlookServicesFileAttachment* attachment = [[MSOutlookServicesFileAttachment alloc] init];
        
        attachment.contentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
        attachment.name = @"TestAttachments.txt";
        //Add Attachment
        [[[[[[self.Client getMe] getMessages] getById:addedMessage.id] getAttachments] addAttachment:attachment callback:^(MSOutlookServicesAttachment *a, MSODataException *e) {
            //Get Message using expand
            NSString *filter = [@"" stringByAppendingFormat: @"Subject eq '%@'", addedMessage.subject ];
            [[[[[[[[self.Client getMe] getFolders] getById: @"Drafts" ] getMessages] filter:filter] expand:@"Attachments"] readWithCallback:^(NSArray<MSOutlookServicesMessage> *expandedMessages, MSODataException *error) {
                //Get message without expand
                [[[[[[[self.Client getMe]  getFolders] getById: @"Drafts" ] getMessages] filter:filter] readWithCallback:^(NSArray<MSOutlookServicesMessage> *notExpandedMessages, MSODataException *error) {
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    test.ExecutionMessages = [NSMutableArray array];
                    
                    NSString* message =  @"";
                    
                    if(error == nil && a != nil && [expandedMessages count] == 1 && [[[expandedMessages objectAtIndex:0] attachments] count] ==1
                       && [notExpandedMessages count] == 1 && [[[notExpandedMessages objectAtIndex:0] attachments] count] ==0  ){
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
                    
                }] resume];
            }] resume];
        }] resume];
    }];
    
    return task;
}


-(NSURLSessionTask*)TestExpand:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *messageSubject = [@"Test Attachment" stringByAppendingString:uuid];
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:messageSubject : self.TestMail : @""];
    //Add message
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        
        MSOutlookServicesFileAttachment* attachment = [[MSOutlookServicesFileAttachment alloc] init];
        
        attachment.contentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
        attachment.name = @"TestAttachments.txt";
        //Add Attachment
        [[[[[[self.Client getMe] getMessages] getById:addedMessage.id] getAttachments] addAttachment:attachment callback:^(MSOutlookServicesAttachment *a, MSODataException *e) {
            //Get Message using expand
            [[[[[[self.Client getMe] getMessages] getById: addedMessage.id] expand:@"Attachments"] readWithCallback:^(MSOutlookServicesMessage *expandedMessage, MSODataException *error) {
                //Get message without expand
                [[[[[self.Client getMe]  getMessages] getById: addedMessage.id ] readWithCallback:^(MSOutlookServicesMessage *notExpandedMessage, MSODataException *error) {
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    test.ExecutionMessages = [NSMutableArray array];
                    
                    NSString* message =  @"";
                    
                    if(error == nil && a != nil && [expandedMessage.attachments count] ==1 && [notExpandedMessage.attachments count] == 0){
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
                    
                }] resume];
            }] resume];
        }] resume];
    }];
    
    return task;
}


#pragma mark FolderTests

-(NSURLSessionTask*)TestGetFolders:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[self.Client getMe] getFolders] readWithCallback:^(NSArray<MSOutlookServicesFolder> *folders, MSODataException *error) {
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

-(NSURLSessionTask*)TestGetFoldersById:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getMe] getFolders] getById:@"Inbox"] readWithCallback:^(MSOutlookServicesFolder *folder, MSODataException *error) {
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

-(NSURLSessionTask*)TestGetFoldersByIdOverload:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[self.Client getMe] getFoldersById:@"Inbox"] readWithCallback:^(MSOutlookServicesFolder *folder, MSODataException *error) {
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

-(NSURLSessionTask*)TestCreateFolder:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOutlookServicesFolder *newFolder = [[MSOutlookServicesFolder alloc] init];
    newFolder.displayName = folderName;
    
    NSURLSessionTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] addFolder:newFolder callback:^(MSOutlookServicesFolder *folder, MSODataException *e) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if(e== nil && [newFolder.displayName isEqualToString:folderName] ){
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

-(NSURLSessionTask*)TestDeleteFolder:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOutlookServicesFolder *newFolder = [[MSOutlookServicesFolder alloc] init];
    newFolder.displayName = folderName;
    
    //Create folder
    NSURLSessionTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] addFolder:newFolder callback:^(MSOutlookServicesFolder *folder, MSODataException *e) {
        [[[[[self.Client getMe] getFolders] getById:folder.id] deleteFolder:^(int status, MSODataException *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e == nil & status == 204){
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

-(NSURLSessionTask*)TestMoveFolder:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOutlookServicesFolder *newFolder = [[MSOutlookServicesFolder alloc] init];
    newFolder.displayName = folderName;
    
    NSURLSessionTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] addFolder:newFolder callback:^(MSOutlookServicesFolder *addedFolder, MSODataException *e) {
        
        [[[[[self.Client getMe] getFolders]getById:addedFolder.id].operations moveWithDestinationId:@"Drafts" callback:^(MSOutlookServicesFolder *folder, MSODataException *error) {
            
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
                [[[[[self.Client getMe]getFolders]getById:folder.id]deleteFolder:^(int status, MSODataException *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }] resume];
            
            result(test);
            
        }] resume];
        
    }];
    
    return task;
}

-(NSURLSessionTask*)TestCopyFolder:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOutlookServicesFolder *newFolder = [[MSOutlookServicesFolder alloc] init];
    newFolder.displayName = folderName;
    
    NSURLSessionTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] addFolder:newFolder callback:^(MSOutlookServicesFolder *addedFolder, MSODataException *e) {
        
        [[[[[self.Client getMe] getFolders]getById:addedFolder.id].operations copyWithDestinationId:@"Drafts" callback:^(MSOutlookServicesFolder *copiedFolder, MSODataException *error) {
            
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
                [[[[[self.Client getMe]getFolders]getById:copiedFolder.id]deleteFolder:^(int status, MSODataException *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }] resume];
            }
            
            [[[[[self.Client getMe]getFolders]getById:addedFolder.id]deleteFolder:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }] resume];
            
            result(test);
            
        }] resume];
        
    }];
    
    return task;
}

-(NSURLSessionTask*)TestUpdateFolder:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOutlookServicesFolder *newFolder = [[MSOutlookServicesFolder alloc] init];
    newFolder.displayName = folderName;
    
    NSURLSessionTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] addFolder:newFolder callback:^(MSOutlookServicesFolder *addedFolder, MSODataException *e) {
        
        NSString *updatedFolderName = [@"Updated" stringByAppendingString:folderName];
        newFolder.displayName = updatedFolderName;
        
        [[[[[self.Client getMe]getFolders]getById:addedFolder.id]updateFolder:newFolder callback:^(MSOutlookServicesFolder *updatedFolder, MSODataException *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && [updatedFolder.displayName isEqualToString:updatedFolderName] ){
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

#pragma mark MessageTests

-(NSURLSessionTask*)TestGetMessages:(void (^) (Test*))result{
    
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] readWithCallback:^(NSArray<MSOutlookServicesMessage> *messages, MSODataException *error) {
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

-(NSURLSessionTask*)TestCreateMessages:(void (^) (Test*))result{
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    newMessage.body = [[MSOutlookServicesItemBody alloc] init];
    newMessage.body.contentType = MSOutlookServices_BodyType_Text;
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = error == nil && addedMessage!= nil  ? @"Ok - ": @"Not - ";
        
        if(addedMessage!= nil && [addedMessage.subject isEqualToString:newMessage.subject]){
            passed = true;
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        if(addedMessage!= nil)
            [[[[[self.Client getMe]getMessages]getById:addedMessage.id]deleteMessage:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetMessageOverload:(void (^) (Test*))result{
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    newMessage.body = [[MSOutlookServicesItemBody alloc] init];
    newMessage.body.contentType = MSOutlookServices_BodyType_Text;
    
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        [[[[self.Client getMe] getMessagesById:addedMessage.id] readWithCallback:^(MSOutlookServicesMessage *searchedMessage, MSODataException *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = error == nil && addedMessage!= nil  ? @"Ok - ": @"Not - ";
            
            if(searchedMessage!= nil && [searchedMessage.id isEqualToString:addedMessage.Id]){
                passed = true;
            }
            
            test.Passed = passed;
            
            [test.ExecutionMessages addObject:message];
            if(addedMessage!= nil)
                [[[[[self.Client getMe]getMessages]getById:addedMessage.id]deleteMessage:^(int status, MSODataException *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }]resume];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestCreateAndSendHtmlMessages:(void (^) (Test*))result{
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Subject Html" : self.TestMail : @""];
    newMessage.body.contentType = MSOutlookServices_BodyType_HTML;
    newMessage.body.content = @"<div>Html Test</div>";
    
    /*NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {*/
        
    return [[self.Client getMe].operations sendMailWithMessage:newMessage
                                             saveToSentItems:true
                                                    callback:^(int returnValue, MSODataException *error) {
                                                        
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
       // }] resume];
        
    }];
}

-(NSURLSessionTask*)TestUpdateMessages:(void (^) (Test*))result {
    
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    //Create message
    NSURLSessionTask *task = [[[self.Client getMe] getMessages] addMessage:newMessage
                                                                  callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        
        NSString *updatedSubject = @"My Updated Subject";
        newMessage.Subject = updatedSubject;
        
        //Update message
        [[[[[self.Client getMe]getMessages]getById:addedMessage.id]updateMessage:newMessage callback:^(MSOutlookServicesMessage *updatedMessage, MSODataException *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = error == nil ? @"Ok - ": @"Not - ";
            
            if(updatedMessage!= nil && [updatedMessage.subject isEqualToString:newMessage.subject]){
                passed = true;
            }
            
            test.Passed = passed;
            
            [test.ExecutionMessages addObject:message];
            if(updatedMessage!= nil)
                [[[[[self.Client getMe]getMessages]getById:updatedMessage.Id]deleteMessage:^(int status, MSODataException *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestDeleteMessages:(void (^) (Test*))result{
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        [[[[[self.Client getMe] getMessages] getById:addedMessage.id]deleteMessage:^(int status, MSODataException *error) {
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

-(NSURLSessionTask*)TestMoveMessages:(void (^) (Test*))result{
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    //Create message
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        //Move message
        [[[[[self.Client getMe]getMessages]getById:addedMessage.Id].operations moveWithDestinationId:@"Inbox" callback:^(MSOutlookServicesMessage *movedMessage, MSODataException *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = error == nil ? @"Ok - ": @"Not - ";
            
            if(movedMessage!= nil && [movedMessage.subject isEqualToString:newMessage.subject]){
                passed = true;
            }
            
            test.Passed = passed;
            
            [test.ExecutionMessages addObject:message];
            
            //Cleanup
            if(movedMessage!= nil)
                [[[[[self.Client getMe]getMessages]getById:movedMessage.id]deleteMessage:^(int status, MSODataException *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestSendMessages:(void (^) (Test*))result{
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    //Send Mail
    NSURLSessionTask* task = [[self.Client getMe].operations sendMailWithMessage:newMessage
                                                                 saveToSentItems:true
                                                                        callback:^(int returnValue, MSODataException *error) {
                                                                            
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

-(NSURLSessionTask*)TestSendWithMessageOperations:(void (^) (Test*))result{
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    //Send Mail
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *message, MSODataException *e) {
        
        [[[[[self.Client getMe] getMessages] getById:message.id].operations sendWithCallback:^(int returnValue, MSODataException *error) {
            
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
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestSendHtmlMessages:(void (^) (Test *))result{
   
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"My Html Subject" : self.TestMail : @""];
    newMessage.body.content = @"<h1>This is an Html body.</h1><a href='#'>With Link!</a>";
    newMessage.body.contentType = MSOutlookServices_BodyType_HTML;
    
    //Send Mail
    NSURLSessionTask* task = [[self.Client getMe].operations sendMailWithMessage:newMessage
                                                                 saveToSentItems:true
                                                                        callback:^(int returnValue, MSODataException *error) {
                                                                            
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


-(NSURLSessionTask*)TestReplyMessages:(void (^) (Test*))result{
    
    NSURLSessionTask* task = [[[[self.Client getMe] getMessages] top:1] readWithCallback:^(NSArray<MSOutlookServicesMessage> *messages, MSODataException *error) {
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            test.Passed = false;
            [test.ExecutionMessages addObject:@"Not - No available mails to reply"];
            result(test);
        }else{
            
            MSOutlookServicesMessage *currentMessage = [messages objectAtIndex:0];
            
            [[[[[self.Client getMe]getMessages]getById:currentMessage.id].operations createReplyWithCallback:^(MSOutlookServicesMessage *replyMessage, MSODataException *error) {
               
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
                    [[[[[self.Client getMe]getMessages]getById:replyMessage.id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                
                result(test);
            }] resume];
        }
    }];
    
    return task;
}

-(NSURLSessionTask*)TestReplyAllMessages:(void (^) (Test*))result{
    
    NSURLSessionTask* task = [[[[self.Client getMe] getMessages] top:1] readWithCallback:^(NSArray<MSOutlookServicesMessage> *messages, MSODataException *error) {
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            test.Passed = false;
            [test.ExecutionMessages addObject:@"Not - No available mails to reply all"];
            result(test);
        }else{
            MSOutlookServicesMessage *currentMessage = [messages objectAtIndex:0];
            
            [[[[[self.Client getMe]getMessages]getById:currentMessage.id].operations createReplyAllWithCallback:^(MSOutlookServicesMessage *replyAllMessage, MSODataException *error) {
                
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
                    [[[[[self.Client getMe]getMessages]getById:replyAllMessage.id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }] resume];
        }
    }];
    
    return task;
}

-(NSURLSessionTask*)TestForwardMessages:(void (^) (Test*))result{
    
    NSURLSessionTask* task = [[[[self.Client getMe] getMessages] top:1] readWithCallback:^(NSArray<MSOutlookServicesMessage> *messages, MSODataException *error) {
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            test.Passed = false;
            [test.ExecutionMessages addObject:@"Not - No available mails to reply all"];
            result(test);
        }else{
            MSOutlookServicesMessage *currentMessage = [messages objectAtIndex:0];
            [[[[[self.Client getMe]getMessages]getById:currentMessage.id].operations createForwardWithCallback:^(MSOutlookServicesMessage *fwMessage, MSODataException *error) {
                
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
                    [[[[[self.Client getMe]getMessages]getById:fwMessage.id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }] resume];
        }
    }];
    
    return task;
}

-(NSURLSessionTask*)TestReplyHtmlMessages:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *messageSubject =[@"My HTML Email" stringByAppendingString:uuid];
    MSOutlookServicesMessage *message = [self getSampleMessage:messageSubject :self.TestMail :@"" ];
    message.body.content = @"<h1>This is an Html body.</h1>";
    message.body.contentType = MSOutlookServices_BodyType_HTML;
    message.body.contentType = MSOutlookServices_BodyType_HTML;
    
    //Send mail with HTML body
    NSURLSessionTask* task = [[self.Client getMe].operations sendMailWithMessage:message
                                                                 saveToSentItems:true                                                                          callback:^(int returnValue, MSODataException *error) {
        // Get sent mail
        [[[[[self.Client getMe] getFolders] filter:@"DisplayName eq 'Sent Items'"] readWithCallback:^(NSArray<MSOutlookServicesFolder> *folders, MSODataException *error) {
            
            MSOutlookServicesFolder *sentItemsFolder = [folders objectAtIndex:0];
            
            [[[[[[[self.Client getMe] getFolders] getById:sentItemsFolder.id ] getMessages]
               filter: [[@"Subject eq '" stringByAppendingString:messageSubject] stringByAppendingString:@"'"]]
              readWithCallback:^(NSArray<MSOutlookServicesMessage> *messages, MSODataException *error) {
                
                if(error == nil && messages.count == 1 && [[[messages objectAtIndex:0] body] contentType] == MSOutlookServices_BodyType_HTML){
                    MSOutlookServicesMessage *currentMessage = [messages objectAtIndex:0];
                    //Reply message
                    [[[[[self.Client getMe] getMessages] getById:currentMessage.id].operations replyWithComment:self.TestMail callback:^(int returnValue, MSODataException *error) {
                        BOOL passed = false;
                        
                        Test *test = [Test alloc];
                        
                        test.ExecutionMessages = [NSMutableArray array];
                        NSString* message = @"";
                        if(error == nil){
                            message =@"Ok - ";
                            passed = true;
                        }else{
                            message = @"Not - ";
                            if(error!=nil)
                                message = [message stringByAppendingString:[error localizedDescription]];
                        }
                        
                        test.Passed = passed;
                        [test.ExecutionMessages addObject:message];
                        
                        result(test);
                    }] resume];
                }
                else {
                    
                    Test *test = [Test alloc];
                    test.ExecutionMessages = [NSMutableArray array];
                    NSString* message = @"Not - Missing mail in inbox. ";
                    if(error!=nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                    
                    test.Passed = false;
                    [test.ExecutionMessages addObject:message];
                    result(test);
                }
            }] resume];
        }] resume];
    }];
    
    
    return task;
}

-(MSOutlookServicesMessage*) getSampleMessage : (NSString*) subject  : (NSString*) to  : (NSString*) cc   {
    MSOutlookServicesMessage *message = [[MSOutlookServicesMessage alloc]init];
    //To recipient
    MSOutlookServicesRecipient *toRecipient = [[MSOutlookServicesRecipient alloc] init];
    MSOutlookServicesEmailAddress* email = [[MSOutlookServicesEmailAddress alloc]init];
    
    email.address = to;
    toRecipient.emailAddress = email;
    
    NSMutableArray *toRecipients = [[NSMutableArray alloc]init];
    [toRecipients addObject:toRecipient];
    
    message.ToRecipients = (NSMutableArray<MSOutlookServicesRecipient>*)toRecipients;
    
    //Cc recipient
    if (![cc isEqualToString:@""]) {
        
        MSOutlookServicesRecipient *ccRecipient = [[MSOutlookServicesRecipient alloc] init];
        MSOutlookServicesEmailAddress* emailCc = [[MSOutlookServicesEmailAddress alloc]init];
        emailCc.address = cc;
        ccRecipient.emailAddress = emailCc;
        
        NSMutableArray<MSOutlookServicesRecipient> *ccRecipients = (NSMutableArray<MSOutlookServicesRecipient>*)[[NSMutableArray alloc]init];
        
        [toRecipients addObject:ccRecipient];
        message.toRecipients = ccRecipients;
    }
    
    //Body & Subject
    message.Subject = subject;
    
    MSOutlookServicesItemBody *body = [[MSOutlookServicesItemBody alloc]init];
    body.Content = @"This is the email body";
    message.Body = body;
    
    return message;
}

#pragma mark ContactTests

-(NSURLSessionTask*)TestGetContactFolder:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[[self.Client getMe] getContactFolders] getById: @"Contacts"] getContacts] readWithCallback:^(NSArray<MSOutlookServicesContact>*contacts, MSODataException *error) {
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

-(NSURLSessionTask*)TestGetContacts:(void (^) (Test*))result{
    MSOutlookServicesContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionTask *task = [[[self.Client getMe] getContacts] addContact:newContact callback:^(MSOutlookServicesContact *addedContact, MSODataException *e) {
        //Get contacts
        [[[[self.Client getMe] getContacts] readWithCallback:^(NSArray<MSOutlookServicesContact>* contacts, MSODataException *error) {
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
                [[[[[self.Client getMe] getContacts] getById:addedContact.id] deleteContact:^(int status, MSODataException * e) {
                    if(e!=nil)
                        NSLog(@"Error: %@", e);
                }] resume];
            
            result(test);
            
        }] resume];
        
    }];
    
    return task;
}


-(NSURLSessionTask*)TestCreateContacts:(void (^) (Test*))result{
    MSOutlookServicesContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionTask *task = [[[self.Client getMe] getContacts] addContact:newContact callback:^(MSOutlookServicesContact *addedContact, MSODataException *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = (error!= nil || addedContact == nil) ? @"Not - " : @"Ok - ";
        [test.ExecutionMessages addObject:message];
        
        if(error != nil){
            [test.ExecutionMessages addObject: [error localizedDescription]];
        }
        
        if(addedContact != nil && [addedContact.displayName isEqualToString: newContact.DisplayName]){
            passed = true;
        }
        
        test.Passed = passed;
        
        //Cleanup
        if(addedContact!= nil)
            [[[[[self.Client getMe] getContacts] getById:addedContact.id] deleteContact:^(int status, MSODataException * error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }] resume];
        
        result(test);
        
    }];
    
    return task;
}


-(NSURLSessionTask*)TestDeleteContacts:(void (^) (Test*))result{
    MSOutlookServicesContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionTask *task = [[[self.Client getMe] getContacts] addContact:newContact callback:^(MSOutlookServicesContact *addedContact, MSODataException *e) {
        //Delete
        [[[[[self.Client getMe] getContacts] getById:addedContact.id] deleteContact:^(int status, MSODataException * error) {
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

-(NSURLSessionTask*)TestUpdateContacts:(void (^) (Test*))result{
    MSOutlookServicesContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionTask *task = [[[self.Client getMe] getContacts] addContact:newContact callback:^(MSOutlookServicesContact *addedContact, MSODataException *error) {
        newContact.displayName = @"New Contact Name";
        
        [[[[[self.Client getMe]getContacts]getById:addedContact.id] updateContact:newContact callback:^(MSOutlookServicesContact *updatedEntity, MSODataException *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = (error!= nil || updatedEntity == nil) ? @"Not - " : @"Ok - ";
            [test.ExecutionMessages addObject:message];
            
            if(error != nil){
                [test.ExecutionMessages addObject: [error localizedDescription]];
            }
            
            if(updatedEntity != nil && updatedEntity.displayName != addedContact.displayName){
                passed = true;
            }
            
            test.Passed = passed;
            
            //Cleanup
            if(updatedEntity!= nil)
                [[[[[self.Client getMe] getContacts] getById:updatedEntity.id] deleteContact:^(int status, MSODataException * error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }] resume];
            
            result(test);
        }] resume];
        
    }];
    
    return task;
}


-(MSOutlookServicesContact *) getContact{
    
    MSOutlookServicesContact* contact = [[MSOutlookServicesContact alloc]init];
    contact.displayName = @"Test Contact";
    contact.givenName = @"Test Contact Name";
    
    MSOutlookServicesEmailAddress *email = [[MSOutlookServicesEmailAddress alloc]init];
    email.address = @"test@test.com";
    
    NSMutableArray<MSOutlookServicesEmailAddress> *list = (NSMutableArray<MSOutlookServicesEmailAddress>*)[[NSMutableArray alloc] init];
    [list addObject:email];
    
    contact.emailAddresses = list;
    
    return contact;
}

#pragma mark CalendarGroupTests

-(NSURLSessionTask*)TestGetCalendarGroups:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[self.Client getMe] getCalendarGroups] readWithCallback:^(NSArray<MSOutlookServicesCalendarGroup> *calendarGroups, MSODataException *error) {
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


-(NSURLSessionTask*)TestCreateCalendarGroups:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    
    MSOutlookServicesCalendarGroup *newCalendarGroup = [[MSOutlookServicesCalendarGroup alloc] init];
    newCalendarGroup.name = calendarGroupName;
    
    NSURLSessionTask* task =[[[self.Client getMe] getCalendarGroups] addCalendarGroup:newCalendarGroup callback:^(MSOutlookServicesCalendarGroup *addedCalendarGroup, MSODataException *e) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if(e== nil && addedCalendarGroup != nil && [addedCalendarGroup.name isEqualToString:calendarGroupName] ){
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
        [[[[[self.Client getMe]getCalendarGroups]getById:addedCalendarGroup.Id]deleteCalendarGroup:^(int status, MSODataException *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }]resume];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetCalendarGroupById:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    
    MSOutlookServicesCalendarGroup *newCalendarGroup = [[MSOutlookServicesCalendarGroup alloc] init];
    newCalendarGroup.name = calendarGroupName;
    //Create calendar group
    NSURLSessionTask* task =[[[self.Client getMe] getCalendarGroups] addCalendarGroup:newCalendarGroup callback:^(MSOutlookServicesCalendarGroup *addedCalendarGroup, MSODataException *e) {
        //Get by id
        [[[[[self.Client getMe]getCalendarGroups]getById:addedCalendarGroup.id]readWithCallback:^(MSOutlookServicesCalendarGroup *calendarGroup, MSODataException *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && calendarGroup != nil && [calendarGroup.name isEqualToString:calendarGroupName] ){
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
            [[[[[self.Client getMe]getCalendarGroups]getById:calendarGroup.id]deleteCalendarGroup:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

- (NSURLSessionTask *)TestUpdateCalendarGroups:(void (^) (Test*))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    NSString *updatedCalendarGroupName = [@"Updated" stringByAppendingString:calendarGroupName];
    
    MSOutlookServicesCalendarGroup *newCalendarGroup = [[MSOutlookServicesCalendarGroup alloc] init];
    newCalendarGroup.name = calendarGroupName;
    
    // Create Calendar
    NSURLSessionTask* task =[[[self.Client getMe] getCalendarGroups] addCalendarGroup:newCalendarGroup callback:^(MSOutlookServicesCalendarGroup *addedCalendarGroup, MSODataException *e) {
        newCalendarGroup.name = updatedCalendarGroupName;
        
        //Update Calendar Group
        [[[[[self.Client getMe] getCalendarGroups] getById:addedCalendarGroup.id] updateCalendarGroup:newCalendarGroup callback:^(MSOutlookServicesCalendarGroup *updatedCalendarGroup, MSODataException *error) {
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
            [[[[[self.Client getMe]getCalendarGroups]getById:updatedCalendarGroup.id]deleteCalendarGroup:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestDeleteCalendarGroups:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    
    MSOutlookServicesCalendarGroup *newCalendarGroup = [[MSOutlookServicesCalendarGroup alloc] init];
    newCalendarGroup.name = calendarGroupName;
    
    //Create Calendar
    NSURLSessionTask* task =[[[self.Client getMe] getCalendarGroups] addCalendarGroup:newCalendarGroup callback:^(MSOutlookServicesCalendarGroup *addedCalendarGroup, MSODataException *e) {
        //Delete Calendar
        [[[[[self.Client getMe]getCalendarGroups]getById:addedCalendarGroup.id]deleteCalendarGroup:^(int status, MSODataException *error) {
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

#pragma mark CalendarTests

-(NSURLSessionTask*)TestGetCalendars:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[self.Client getMe] getCalendars] readWithCallback:^(NSArray<MSOutlookServicesCalendar> *calendars, MSODataException *error) {
        
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

-(NSURLSessionTask*)TestGetDefaultCalendar:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[self.Client getMe] getCalendar] readWithCallback:^(MSOutlookServicesCalendar *calendar, MSODataException *error) {
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

-(NSURLSessionTask*)TestCreateCalendar:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    
    MSOutlookServicesCalendar *newCalendar = [[MSOutlookServicesCalendar alloc] init];
    newCalendar.name = calendarName;
    
    NSURLSessionTask* task =[[[self.Client getMe] getCalendars] addCalendar:newCalendar callback:^(MSOutlookServicesCalendar *addedCalendar, MSODataException *e) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if(e== nil && addedCalendar != nil && [addedCalendar.name isEqualToString:calendarName] ){
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
        [[[[[self.Client getMe]getCalendars]getById:addedCalendar.id]deleteCalendar:^(int status, MSODataException *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }]resume];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetCalendarById:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    
    MSOutlookServicesCalendar *newCalendar = [[MSOutlookServicesCalendar alloc] init];
    newCalendar.name = calendarName;
    
    //Create calendar
    NSURLSessionTask* task =[[[self.Client getMe] getCalendars] addCalendar:newCalendar callback:^(MSOutlookServicesCalendar *addedCalendar, MSODataException *e) {
        //Get by id
        [[[[[self.Client getMe]getCalendars]getById:addedCalendar.id] readWithCallback:^(MSOutlookServicesCalendar *calendar, MSODataException *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && calendar != nil && [calendar.name isEqualToString:calendarName] ){
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
            [[[[[self.Client getMe]getCalendars]getById:calendar.id]deleteCalendar:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestUpdateCalendar:(void (^) (Test*))result{
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    NSString *updatedCalendarName = [@"Updated" stringByAppendingString:calendarName];
    
    MSOutlookServicesCalendar *newCalendar = [[MSOutlookServicesCalendar alloc] init];
    newCalendar.name = calendarName;
    
    // Create Calendar
    NSURLSessionTask* task =[[[self.Client getMe] getCalendars] addCalendar:newCalendar callback:^(MSOutlookServicesCalendar *addedCalendar, MSODataException *e) {
        
        newCalendar.Name = updatedCalendarName;
        //Update Calendar
        [[[[[self.Client getMe] getCalendars] getById:addedCalendar.id] updateCalendar:newCalendar callback:^(MSOutlookServicesCalendar *updatedCalendar, MSODataException *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && updatedCalendar != nil && [updatedCalendar.name isEqualToString:updatedCalendarName] ){
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
            [[[[[self.Client getMe]getCalendars]getById:updatedCalendar.id]deleteCalendar:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestDeleteCalendar:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    
    MSOutlookServicesCalendar *newCalendar = [[MSOutlookServicesCalendar alloc] init];
    newCalendar.name = calendarName;
    
    //Create Calendar
    NSURLSessionTask* task =[[[self.Client getMe] getCalendars] addCalendar:newCalendar callback:^(MSOutlookServicesCalendar *addedCalendar, MSODataException *e) {
        
        //Delete Calendar
        [[[[[self.Client getMe]getCalendars]getById:addedCalendar.id]deleteCalendar:^(int status, MSODataException *error) {
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

-(NSURLSessionTask*)TestGetCalendarView:(void (^) (Test*))result{
    MSOutlookServicesEvent *newEvent = [self getSampleEvent];
    NSURLSessionTask* task = [[[self.Client getMe] getEvents] addEvent:newEvent callback:^(MSOutlookServicesEvent *addedEvent, MSODataException *e) {

        [[[[[[self.Client getMe] getCalendarView] addCustomParametersWithName:@"startdatetime" value:newEvent.start] addCustomParametersWithName:@"enddatetime" value:newEvent.end ] readWithCallback:^(NSArray<MSOutlookServicesEvent> *events, MSODataException *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && addedEvent != nil && [events count] > 0){
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
            [[[[[self.Client getMe]getEvents]getById:addedEvent.Id] deleteEvent:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

#pragma mark EventTests

-(NSURLSessionTask*)TestGetEvents:(void (^) (Test*))result{
    MSOutlookServicesEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionTask *task = [[[self.Client getMe] getEvents] addEvent:event callback:^(MSOutlookServicesEvent *addedEvent, MSODataException *e) {
        //Get Events
        [[[[self.Client getMe]getEvents]readWithCallback:^(NSArray<MSOutlookServicesEvent> *events, MSODataException *error) {
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
            [[[[[self.Client getMe]getEvents]getById:addedEvent.id]deleteEvent:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        }] resume];
        
        
    }];
    
    return task;
}

-(NSURLSessionTask*)TestCreateEvents:(void (^) (Test*))result{
    MSOutlookServicesEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionTask *task = [[[self.Client getMe] getEvents] addEvent:event callback:^(MSOutlookServicesEvent *addedEvent, MSODataException *e) {
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
        [[[[[self.Client getMe]getEvents]getById:addedEvent.id]deleteEvent:^(int status, MSODataException *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }]resume];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestUpdateEvents:(void (^) (Test*))result{
    MSOutlookServicesEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionTask *task = [[[self.Client getMe] getEvents] addEvent:event callback:^(MSOutlookServicesEvent *addedEvent, MSODataException *e) {
        
        NSString *updatedSubject = [@"Updated" stringByAppendingString:event.subject];
        event.subject = updatedSubject;
        // Update Event
        [[[[[self.Client getMe] getEvents] getById:addedEvent.id]updateEvent:event callback:^(MSOutlookServicesEvent *updatedEvent, MSODataException *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message =  @"";
            if(error == nil && updatedEvent != nil && [updatedEvent.subject isEqualToString:updatedSubject]){
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
            [[[[[self.Client getMe]getEvents]getById:addedEvent.Id]deleteEvent:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        } ]resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestDeleteEvents:(void (^) (Test*))result{
    MSOutlookServicesEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionTask *task = [[[self.Client getMe] getEvents] addEvent:event callback:^(MSOutlookServicesEvent *addedEvent, MSODataException *e) {
        //Delete event
        [[[[[self.Client getMe]getEvents]getById:addedEvent.id]deleteEvent:^(int status, MSODataException *error) {
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

-(NSURLSessionTask*)TestCreateMessageWithAttachment:(void (^) (Test*))result{
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"Test Attachment" : self.TestMail : @""];
    
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        
        if(addedMessage!= nil && [addedMessage.subject isEqualToString:newMessage.subject]){
            
            MSOutlookServicesFileAttachment* attachment = [[MSOutlookServicesFileAttachment alloc] init];
            
            attachment.contentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
            attachment.name = @"TestAttachments.txt";
            
            [[[[[[self.Client getMe] getMessages] getById:addedMessage.Id] getAttachments] addAttachment:attachment callback:^(MSOutlookServicesAttachment *a, MSODataException *e) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.ExecutionMessages = [NSMutableArray array];
                
                NSString* message =  @"";
                
                if(error == nil && a != nil && [a.Name isEqualToString: attachment.Name]){
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
                
                
            }] resume];
        }
    }];
    
    return task;
    
}

-(NSURLSessionTask*)TestGetAttachment:(void (^) (Test*))result{
    MSOutlookServicesMessage *newMessage = [self getSampleMessage:@"Test Attachment" : self.TestMail : @""];
    
    NSURLSessionTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage callback:^(MSOutlookServicesMessage *addedMessage, MSODataException *error) {
        
        if(addedMessage!= nil && [addedMessage.Subject isEqualToString:newMessage.Subject]){
            
            MSOutlookServicesFileAttachment* attachment = [[MSOutlookServicesFileAttachment alloc] init];
            
            attachment.contentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
            attachment.name = @"TestAttachments.txt";
            
            [[[[[[self.Client getMe] getMessages] getById:addedMessage.Id] getAttachments] addAttachment:attachment callback:^(MSOutlookServicesAttachment *a, MSODataException *e) {
                
                [[[[[[[[self.Client getMe] getMessages] getById:addedMessage.Id] getAttachments] getById:a.Id] asFileAttachment] readWithCallback:^(MSOutlookServicesFileAttachment *fileAttachment, MSODataException *error) {
                    
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    
                    test.ExecutionMessages = [NSMutableArray array];
                    
                    NSString* message =  @"";
                    
                    // [[NSString alloc] initWithData:content encoding:NSUTF8StringEncoding];
                    
                    NSString* attachmentContent = [[NSString alloc] initWithData:fileAttachment.contentBytes encoding:NSUTF8StringEncoding];
                    
                    if(error == nil && a != nil && [a.name isEqualToString: attachment.name]
                       && [@"Test Message Attachments" isEqualToString:attachmentContent ]){
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
                    
                }] resume];
            }] resume];
        }
    }];
    
    return task;
    
}

-(MSOutlookServicesEvent*) getSampleEvent{
    
    MSOutlookServicesEvent *event= [[MSOutlookServicesEvent alloc]init];
    event.subject = @"Today's appointment";
    event.start = [NSDate date];
    event.end = [[NSDate date] dateByAddingTimeInterval: 3600];
    MSOutlookServicesImportance importance = MSOutlookServices_Importance_High;
    event.importance = importance;
    
    //Event Body
    MSOutlookServicesItemBody *itemBody = [[MSOutlookServicesItemBody alloc] init];
    itemBody.content = @"This is the appointment info";
    
    MSOutlookServicesBodyType bt = MSOutlookServices_BodyType_Text;
    itemBody.contentType = bt;
    event.body = itemBody;
    
    // Attendees
    MSOutlookServicesAttendee *attendee1 = [[MSOutlookServicesAttendee alloc]init];
    MSOutlookServicesEmailAddress *email = [[MSOutlookServicesEmailAddress alloc]init];
    
    email.address = self.TestMail;
    attendee1.emailAddress = email;
    
    NSMutableArray *attendees = [[NSMutableArray alloc] init];
    [attendees addObject:attendee1];
    
    event.attendees = (NSMutableArray<MSOutlookServicesAttendee>*)attendees;
    
    return event;
}

@end