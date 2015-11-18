/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "core/MSOCalendarSerializer.h"
#import "MailTestRunner.h"
#import "TestParameters.h"
#import "Test.h"

#define NSLog NSLog(@"%s,%d",__FILE__,__LINE__);NSLog

@interface MailTestRunner()

@property (nonatomic, weak) MailTestRunner* weakSelf;

@end

@implementation MailTestRunner

- (id)initWithClient:(MSOutlookClient *)client {
    
    if (self = [super init]) {
        
        _weakSelf = self;
        
        self.client = client;
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *mail = [userDefaults objectForKey: @"TestMail"];
        
        self.testMail = mail == nil ? @"":mail ;
    }
    
    return self;
}

- (void)run:(NSString *)testName completionHandler:(void(^)(Test *test))result{
    
    //General
    if([testName isEqualToString: @"TestGetUser"]) return [self testGetUser:result];
    if([testName isEqualToString: @"TestTop"]) return [self testTop:result];
    if([testName isEqualToString: @"TestCount"]) return [self testCount:result];
    if([testName isEqualToString: @"TestFilterWithTop"]) return [self testFilterWithTop:result];
    if([testName isEqualToString: @"TestSelect"]) return [self testSelect:result];
    if([testName isEqualToString: @"TestSkip"]) return [self testSkip:result];
    if([testName isEqualToString: @"TestOrderBy"]) return [self testOrderBy:result];
    if([testName isEqualToString: @"TestExpandLists"]) return [self testExpandLists:result];
    if([testName isEqualToString: @"TestExpand"]) return [self testExpand:result];
    
    // Contacts Tests
    if([testName isEqualToString:@"TestGetContactFolder"]) return [self testGetContactFolder:result];
    if([testName isEqualToString:@"TestGetContacts"]) return [self testGetContacts:result];
    if([testName isEqualToString:@"TestCreateContacts"]) return [self testCreateContacts:result];
    if([testName isEqualToString:@"TestDeleteContacts"]) return [self testDeleteContacts:result];
    if([testName isEqualToString:@"TestUpdateContacts"]) return [self testUpdateContacts:result];
    
    //Mail Tests
    if([testName isEqualToString:@"TestGetMessages"]) return [self testGetMessages:result];
    if([testName isEqualToString:@"TestGetMessagesOverload"])return [self testGetMessageOverload:result];
    if([testName isEqualToString:@"TestCreateMessages"])return [self testCreateMessages:result];
    if([testName isEqualToString:@"TestCreateHtmlMessages"])return [self testCreateAndSendHtmlMessages:result];
    if([testName isEqualToString:@"TestCreateMessageWithAttachment"])return [self testCreateMessageWithAttachment:result];
    if([testName isEqualToString:@"TestGetAttachment"])return [self testGetAttachment:result];
    if([testName isEqualToString:@"TestUpdateMessages"])return [self testUpdateMessages:result];
    if([testName isEqualToString:@"TestDeleteMessages"])return [self testDeleteMessages:result];
    if([testName isEqualToString:@"TestMoveMessages"])return [self testMoveMessages:result];
    if([testName isEqualToString:@"TestCopyMessages"])return [self testCopyMessages:result];
    if([testName isEqualToString:@"TestSendMessages"])return [self testSendMessages:result];
    if([testName isEqualToString:@"TestSendWithMessageOperations"])return [self testSendWithMessageOperations:result];
    if([testName isEqualToString:@"TestSendHtmlMessages"])return [self testSendHtmlMessages:result];
    if([testName isEqualToString:@"TestReplyMessages"])return [self testReplyMessages:result];
    if([testName isEqualToString:@"TestReplyAllMessages"])return [self testReplyAllMessages:result];
    if([testName isEqualToString:@"TestForwardMessages"])return [self testForwardMessages:result];
    if([testName isEqualToString:@"TestReplyHtmlMessages"])return [self testReplyHtmlMessages:result];
    
    // Folder tests
    if([testName isEqualToString:@"TestGetFolders"])return [self testGetFolders:result];
    if([testName isEqualToString:@"TestGetmailFoldersById"])return [self testGetmailFoldersById:result];
    if([testName isEqualToString:@"TestGetmailFoldersByIdOverload"])return [self testGetmailFoldersByIdOverload:result];
    if([testName isEqualToString:@"TestCreateFolder"])return [self testCreateFolder:result];
    if([testName isEqualToString:@"TestDeleteFolder"])return [self testDeleteFolder:result];
    if([testName isEqualToString:@"TestMoveFolder"])return [self testMoveFolder:result];
    if([testName isEqualToString:@"TestCopyFolder"])return [self testCopyFolder:result];
    if([testName isEqualToString:@"TestUpdateFolder"])return [self testUpdateFolder:result];
    
    //Calendar groups Tests
    if([testName isEqualToString:@"TestGetCalendarGroups"])return [self testGetCalendarGroups:result];
    if([testName isEqualToString:@"TestCreateCalendarGroups"])return [self testCreateCalendarGroups:result];
    if([testName isEqualToString:@"TestGetCalendarGroupById"])return [self testGetCalendarGroupById:result];
    if([testName isEqualToString:@"TestUpdateCalendarGroups"])return [self testUpdateCalendarGroups:result];
    if([testName isEqualToString:@"TestDeleteCalendarGroups"])return [self testDeleteCalendarGroups:result];
    
    // Calendar Tests
    if([testName isEqualToString:@"TestGetCalendars"])return [self testGetCalendars:result];
    if([testName isEqualToString:@"TestGetDefaultCalendar"])return [self testGetDefaultCalendar:result];
    if([testName isEqualToString:@"TestCreateCalendar"])return [self testCreateCalendar:result];
    if([testName isEqualToString:@"TestGetCalendarById"])return [self testGetCalendarById:result];
    if([testName isEqualToString:@"TestUpdateCalendar"])return [self testUpdateCalendar:result];
    if([testName isEqualToString:@"TestDeleteCalendar"])return [self testDeleteCalendar:result];
    if([testName isEqualToString:@"TestGetCalendarView"])return [self testGetCalendarView:result];
    //Events Tests
    
    if([testName isEqualToString:@"TestGetEvents"])return [self testGetEvents:result];
    if([testName isEqualToString:@"TestCreateEvents"])return [self testCreateEvents:result];
    if([testName isEqualToString:@"TestUpdateEvents"])return [self testUpdateEvents:result];
    if([testName isEqualToString:@"TestDeleteEvents"])return [self testDeleteEvents:result];
    
    /*
     else{
     return [self TestDefaultWithCompletionHandler:result];
     }
     */
}

- (NSMutableArray *)getTests {
    
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUser" displayName:@"Get User" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestTop" displayName:@"Can use top" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCount" displayName:@"Can use count" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestFilterWithTop" displayName:@"Can use filter with top" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSelect" displayName:@"Can use select with top" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSkip" displayName:@"Can use skip" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestOrderBy" displayName:@"Can use order by" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestExpandLists" displayName:@"Can use expand in lists" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestExpand" displayName:@"Can use expand" ]];
    
    //Folder tests
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetFolders" displayName:@"Get Folders" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetmailFoldersById" displayName:@"Get Folders by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetmailFoldersByIdOverload" displayName:@"Get Folders by Id (overload)" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateFolder" displayName:@"Create Folder" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteFolder" displayName:@"Delete Folders" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestMoveFolder" displayName:@"Move Folders" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCopyFolder" displayName:@"Copy Folders" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestUpdateFolder" displayName:@"Update Folders" ]];
    
    
    //Messages Tests
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetMessages" displayName:@"Get Messages" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetMessagesOverload" displayName:@"Get Message (overload)" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateMessages" displayName:@"Create message in drafts" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateHtmlMessages" displayName:@"Create and Send Html message in drafts" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestUpdateMessages" displayName:@"Update message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteMessages" displayName:@"Delete message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestMoveMessages" displayName:@"Move message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCopyMessages" displayName:@"Copy message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSendMessages" displayName:@"Send message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSendWithMessageOperations" displayName:@"Send with message operations" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSendHtmlMessages" displayName:@"Send Html message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestReplyMessages" displayName:@"Reply message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestReplyAllMessages" displayName:@"ReplyAll message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestForwardMessages" displayName:@"Forward message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateMessageWithAttachment" displayName:@"Create Message With Attachment" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetAttachment" displayName:@"Get Attachment" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestReplyHtmlMessages" displayName:@"Reply Html message" ]];
    
    // Contacts Tests
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetContactFolder" displayName:@"Get contacts folder" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetContacts" displayName:@"Get contacts" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateContacts" displayName:@"Create contacts" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteContacts" displayName:@"Delete contacts" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestUpdateContacts" displayName:@"Update contacts" ]];
    
    // Calendar Groups Tests
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarGroups" displayName:@"Get calendar groups" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateCalendarGroups" displayName:@"Create calendar groups" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarGroupById" displayName:@"Get calendar groups by id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestUpdateCalendarGroups" displayName:@"Update calendar groups" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteCalendarGroups" displayName:@"Delete calendar groups" ]];
    
    // Calendar Tests
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendars" displayName:@"Get calendars" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetDefaultCalendar" displayName:@"Get default calendar" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateCalendar" displayName:@"Create calendar" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarById" displayName:@"Get calendar by id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestUpdateCalendar" displayName:@"Update calendar" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteCalendar" displayName:@"Delete calendar" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarView" displayName:@"Get calendar view" ]];
    
    //Event Tests
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetEvents" displayName:@"Get events" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateEvents" displayName:@"Create event" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestUpdateEvents" displayName:@"Update event" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteEvents" displayName:@"Delete event" ]];
    
    return array;
}

#pragma mark GeneralTests

- (void)testGetUser:(void(^)(Test *))result {
    
    return [_weakSelf.client.me readWithCallback:^(MSOutlookUser *user, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = (user != nil) ? @"Ok - ": @"Not - ";
        
        if(user != nil){
            passed = true;
        }
        
        test.passed = passed;
        
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testTop:(void(^)(Test *))result {

    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc: @""];
    
    return [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage2, MSOrcError *e) {
            
            
            [[[_weakSelf.client.me mailFoldersById:@"Inbox"].messages top:1]readWithCallback:^(NSArray *messages, MSOrcError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.executionMessages = [NSMutableArray array];
                
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
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                
                if(addedMessage!= nil)
                    [[_weakSelf.client.me.messages getById:addedMessage._id] delete:^(int status, MSOrcError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                if(addedMessage2!= nil)
                    [[_weakSelf.client.me.messages getById:addedMessage2._id] delete:^(int status, MSOrcError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                result(test);
            }];
        }];
    }];
}

- (void)testCount:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc:@""];
    
    return [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *message, MSOrcError *e) {
        
        [_weakSelf.client.me.messages count:^(NSInteger count, MSOrcError *e) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = @"";
            
            if (e == nil && count > 0) {
                
                passed = true;
                message =@"Ok - ";
            }
            else {
                message = @"Not - ";
                
                if (e != nil)
                    message = [message stringByAppendingString:[e localizedDescription]];
            }
            
            test.passed = passed;
            
            [test.executionMessages addObject:message];
            
            result(test);
            
        }];
    }];
}

- (void)testFilterWithTop:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc:@""];
    
    return [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage2, MSOrcError *e) {
            
            [[[[_weakSelf.client.me.mailFolders getById:@"Drafts"].messages filter:@"Subject eq 'My Subject'"] top:1]readWithCallback:^(NSArray *messages, MSOrcError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.executionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                
                if (error==nil && messages!= nil && [messages count] == 1) {
                    
                    passed = true;
                    message =@"Ok - ";
                }
                else {
                    
                    message = @"Not - ";
                    if(error != nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                
                if(addedMessage!= nil)
                    [[_weakSelf.client.me.messages getById:addedMessage._id] delete:^(int status, MSOrcError *error) {
                        
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                if(addedMessage2!= nil)
                    [[_weakSelf.client.me.messages getById:addedMessage2._id] delete:^(int status, MSOrcError *error) {
                        
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                result(test);
            }];
        }];
    }];
}

- (void)testSelect:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc:@""];
    
    return [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage2, MSOrcError *e) {
            
            [[[_weakSelf.client.me.messages select:@"Subject"]top:1] readWithCallback:^(NSArray *messages, MSOrcError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.executionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                MSOutlookMessage *current =(messages!= nil && [messages count] == 1) ? [messages objectAtIndex:0] : nil;
                
                if(error==nil && messages!= nil && [messages count] == 1 && current.receivedDateTime == nil){
                    passed = true;
                    message =@"Ok - ";
                }
                else{
                    message = @"Not - ";
                    if(error != nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                
                if(addedMessage!= nil)
                    [[_weakSelf.client.me.messages getById:addedMessage._id] delete:^(int status, MSOrcError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                if(addedMessage2!= nil)
                    [[_weakSelf.client.me.messages getById:addedMessage2._id] delete:^(int status, MSOrcError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                result(test);
            }];
        }];
    }];
}

- (void)testSkip:(void(^)(Test *))result {
    
    MSOutlookContact* contact1 = [self getContact];
    NSString *contact1Name = [@"AA" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    contact1.displayName = contact1Name;
    
    MSOutlookContact* contact2 = [self getContact];
    NSString *contact2Name = [@"BB" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    contact2.displayName = contact2Name;
    
    //Create contact1
    return [_weakSelf.client.me.contacts add:contact1 callback:^(MSOutlookContact *addedContact1, MSOrcError *error) {
        
        // Create contact2
        [_weakSelf.client.me.contacts add:contact2 callback:^(MSOutlookContact *addedContact2, MSOrcError *e) {
            
            //Test order by
            NSString *filter = [@"" stringByAppendingFormat:@"DisplayName eq '%@' or DisplayName eq '%@'", contact1Name, contact2Name ];
            
            [[[[_weakSelf.client.me.contacts filter:filter] orderBy:@"DisplayName Desc"] skip:1] readWithCallback:^(NSArray *contacts, MSOrcError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                test.executionMessages = [NSMutableArray array];
                
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
                
                [test.executionMessages addObject:message];
                test.passed = passed;
                
                
                //Cleanup
                if(addedContact1!= nil)
                    [[_weakSelf.client.me.contacts getById:addedContact1._id] delete:^(int status, MSOrcError * error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                if(addedContact2!= nil)
                    [[_weakSelf.client.me.contacts getById:addedContact2._id] delete:^(int status, MSOrcError * error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                result(test);
                
            }];
        }];
    }];
}

- (void)testOrderBy:(void(^)(Test *))result {
    
    MSOutlookContact* contact1 = [self getContact];
    NSString *contact1Name = [@"AA" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    contact1.displayName = contact1Name;
    
    MSOutlookContact* contact2 = [self getContact];
    NSString *contact2Name = [@"BB" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    contact2.displayName = contact2Name;
    
    //Create contact1
    return [_weakSelf.client.me.contacts add:contact1 callback:^(MSOutlookContact *addedContact1, MSOrcError *error) {
        
        // Create contact2
        [_weakSelf.client.me.contacts add:contact2 callback:^(MSOutlookContact *addedContact2, MSOrcError *e) {
            
            //Test order by
            NSString *filter = [@"" stringByAppendingFormat:@"DisplayName eq '%@' or DisplayName eq '%@'", contact1Name, contact2Name ];
            
            // Get contacts Desc
            [[[_weakSelf.client.me.contacts filter:filter] orderBy:@"DisplayName Desc"] readWithCallback:^(NSArray *contactsDesc, MSOrcError *error) {
                
                //Get contacts Asc
                [[[_weakSelf.client.me.contacts filter:filter] orderBy:@"DisplayName Asc"] readWithCallback:^(NSArray *contactsAsc, NSError *error) {
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    test.executionMessages = [NSMutableArray array];
                    
                    NSString* message = @"";
                    
                    if(error == nil && [contactsAsc count] == 2 && [contactsDesc count] == 2 && [[[contactsAsc objectAtIndex:0] displayName] isEqualToString:contact1Name] && [[[contactsDesc objectAtIndex:0] displayName] isEqualToString:contact2Name])
                    {
                        passed = true;
                    }
                    else
                    {
                        message = @"Not - ";
                        if(error != nil){
                            [message stringByAppendingString: [error localizedDescription]];
                        }
                    }
                    
                    [test.executionMessages addObject:message];
                    test.passed = passed;
                    
                    //Cleanup
                    if(addedContact1!= nil)
                        [[_weakSelf.client.me.contacts getById:addedContact1._id] delete:^(int status, MSOrcError * error) {
                            if(error!= nil)
                                NSLog(@"Error: %@", error);
                        }];
                    
                    if(addedContact2!= nil)
                        [[_weakSelf.client.me.contacts getById:addedContact2._id] delete:^(int status, MSOrcError * error) {
                            if(error!= nil)
                                NSLog(@"Error: %@", error);
                        }];
                    
                    result(test);
                    
                }];
            }];
        }];
    }];
}

- (void)testExpandLists:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *messageSubject = [@"Test Attachment" stringByAppendingString:uuid];
    MSOutlookMessage *newMessage = [self getSampleMessage:messageSubject to:self.testMail cc:@""];
    
    //Add message
    
    return[_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        MSOutlookFileAttachment* attachment = [[MSOutlookFileAttachment alloc] init];
        
        attachment.contentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
        attachment.name = @"TestAttachments.txt";
        
        //Add Attachment
        [[_weakSelf.client.me.messages getById:addedMessage._id].attachments add:attachment callback:^(MSOutlookAttachment *a, MSOrcError *e) {
            //Get Message using expand
            
            NSString *filter = [@"" stringByAppendingFormat: @"Subject eq '%@'", addedMessage.subject];
            
            [[[_weakSelf.client.me.messages filter:filter] expand:@"Attachments"] readWithCallback:^(NSArray *expandedMessages, MSOrcError *error) {
                //Get message without expand
                
                [[_weakSelf.client.me.messages filter:filter] readWithCallback:^(NSArray *notExpandedMessages, MSOrcError *error) {
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    test.executionMessages = [NSMutableArray array];
                    
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
                    
                    test.passed = passed;
                    [test.executionMessages addObject:message];
                    
                    result(test);
                }];
            }];
        }];
    }];
}

- (void)testExpand:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *messageSubject = [@"Test Attachment" stringByAppendingString:uuid];
    MSOutlookMessage *newMessage = [self getSampleMessage:messageSubject to:self.testMail cc:@""];
    
    //Add message
    return[_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        MSOutlookFileAttachment* attachment = [[MSOutlookFileAttachment alloc] init];
        
        attachment.contentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
        attachment.name = @"TestAttachments.txt";
        
        //Add Attachment
        [[_weakSelf.client.me.messages getById:addedMessage._id].attachments add:attachment callback:^(MSOutlookAttachment *a, MSOrcError *e) {
            
            //Get Message using expand
            [[[_weakSelf.client.me.messages getById: addedMessage._id] expand:@"Attachments"] readWithCallback:^(MSOutlookMessage *expandedMessage, MSOrcError *error) {
                
                //Get message without expand
                [[_weakSelf.client.me.messages getById:addedMessage._id] readWithCallback:^(MSOutlookMessage *notExpandedMessage, MSOrcError *error) {
                    
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    test.executionMessages = [NSMutableArray array];
                    
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
                    
                    test.passed = passed;
                    [test.executionMessages addObject:message];
                    
                    result(test);
                    
                }];
            }];
        }];
    }];
}


#pragma mark FolderTests

- (void)testGetFolders:(void(^)(Test *))result {
    
    return [_weakSelf.client.me.mailFolders readWithCallback:^(NSArray *mailFolders, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = [mailFolders count]>0  ? @"Ok - ": @"Not - ";
        
        if ([mailFolders count] > 0) {
            
            passed = true;
        }
        
        test.passed = passed;
        
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testGetmailFoldersById:(void(^)(Test *))result {
    
    return [[_weakSelf.client.me.mailFolders getById:@"Inbox"] readWithCallback:^(MSOutlookMailFolder *folder, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = (error!=nil && folder!= nil)  ? @"Ok - ": @"Not - ";
        [test.executionMessages addObject:message];
        
        if (error != nil) {
            
            [test.executionMessages addObject: [error localizedDescription]];
        }
        
        if (folder != nil) {
            
            passed = true;
        }
        
        test.passed = passed;
        
        result(test);
    }];
}

- (void)testGetmailFoldersByIdOverload:(void(^)(Test *))result {
    
    return [[_weakSelf.client.me mailFoldersById:@"Inbox"] readWithCallback:^(MSOutlookMailFolder *folder, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = (error!=nil && folder!= nil)  ? @"Ok - ": @"Not - ";
        [test.executionMessages addObject:message];
        
        if (error != nil) {
            [test.executionMessages addObject: [error localizedDescription]];
        }
        
        if (folder != nil) {
            
            passed = true;
        }
        
        test.passed = passed;
        
        result(test);
    }];
}

- (void)testCreateFolder:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOutlookMailFolder *newFolder = [[MSOutlookMailFolder alloc] init];
    newFolder.displayName = folderName;
    
    return [[_weakSelf.client.me.mailFolders getById:@"Inbox"].childFolders add:newFolder callback:^(MSOutlookMailFolder *folder, MSOrcError *e) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if (e== nil && [newFolder.displayName isEqualToString:folderName]) {
            
            message = @"Ok - ";
            passed = true;
        }
        else {
            
            message = @"Not - ";
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testDeleteFolder:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOutlookMailFolder *newFolder = [[MSOutlookMailFolder alloc] init];
    newFolder.displayName = folderName;
    
    //Create folder
    return [[_weakSelf.client.me.mailFolders getById:@"Inbox"].childFolders add:newFolder callback:^(MSOutlookMailFolder *folder, MSOrcError *e) {
        
        [[_weakSelf.client.me.mailFolders getById:folder._id] delete:^(int status, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e == nil & status == 204){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = [@"Not - " stringByAppendingString:[error localizedDescription]];
            }
            
            [test.executionMessages addObject:message];
            test.passed = passed;
            result(test);
        }];
    }];
}

- (void)testMoveFolder:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOutlookMailFolder *newFolder = [[MSOutlookMailFolder alloc] init];
    newFolder.displayName = folderName;
    
    return [[_weakSelf.client.me.mailFolders getById:@"Inbox"].childFolders add:newFolder callback:^(MSOutlookMailFolder *addedFolder, MSOrcError *e) {
        
        [[_weakSelf.client.me.mailFolders getById:addedFolder._id].operations moveWithDestinationId:@"Drafts" callback:^(MSOutlookMailFolder *folder, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = @"";
            
            if (error== nil && folder!=nil) {
                
                message = @"Ok - ";
                passed = true;
            }
            else {
                
                message = @"Not - ";
                
                if (error!= nil) {
                    
                    message = [message stringByAppendingString:[error localizedDescription]];
                }
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            //Cleanup
            if(folder!= nil)
                [[_weakSelf.client.me.mailFolders getById:folder._id] delete:^(int status, MSOrcError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            
            result(test);
            
        }];
    }];
}

- (void)testCopyFolder:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOutlookMailFolder *newFolder = [[MSOutlookMailFolder alloc] init];
    newFolder.displayName = folderName;
    
    return [[_weakSelf.client.me.mailFolders getById:@"Inbox"].childFolders add:newFolder callback:^(MSOutlookMailFolder *addedFolder, MSOrcError *e) {
        
        [[_weakSelf.client.me.mailFolders getById:addedFolder._id].operations copyWithDestinationId:@"Drafts" callback:^(MSOutlookMailFolder *copiedFolder, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if (error== nil && copiedFolder!=nil ) {
                
                message = @"Ok - ";
                passed = true;
            }
            else {
                
                message = @"Not - ";
                
                if (error!= nil) {
                    
                    message = [message stringByAppendingString:[error localizedDescription]];
                }
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            //Cleanup
            if(copiedFolder!= nil)
            {
                [[_weakSelf.client.me.mailFolders getById:copiedFolder._id] delete:^(int status, MSOrcError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            }
            
            [[_weakSelf.client.me.mailFolders getById:addedFolder._id] delete:^(int status, MSOrcError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
            
        }];
    }];
    
}

- (void)testUpdateFolder:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSOutlookMailFolder *newFolder = [[MSOutlookMailFolder alloc] init];
    newFolder.displayName = folderName;
    
    return [[_weakSelf.client.me.mailFolders getById:@"Inbox"].childFolders add:newFolder callback:^(MSOutlookMailFolder *addedFolder, MSOrcError *e) {
        
        NSString *updatedFolderName = [@"Updated" stringByAppendingString:folderName];
        newFolder.displayName = updatedFolderName;
        
        [[_weakSelf.client.me.mailFolders getById:addedFolder._id] update:newFolder callback:^(MSOutlookMailFolder *updatedFolder, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && [updatedFolder.displayName isEqualToString:updatedFolderName] ){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = @"Not - ";
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            result(test);
        }];
    }];
}

#pragma mark MessageTests

- (void)testGetMessages:(void(^)(Test *))result {
    
    return [_weakSelf.client.me.messages readWithCallback:^(NSArray *messages, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = [messages count]>0  ? @"Ok - ": @"Not - ";
        
        if([messages count]>0){
            passed = true;
        }
        
        test.passed = passed;
        
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testCreateMessages:(void(^)(Test *))result  {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc:@""];
    newMessage.body = [[MSOutlookItemBody alloc] init];
    newMessage.body.contentType = MSOutlookBodyTypeText;
    
    return [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = error == nil && addedMessage!= nil  ? @"Ok - ": @"Not - ";
        
        if(addedMessage!= nil && [addedMessage.subject isEqualToString:newMessage.subject]){
            passed = true;
        }
        
        test.passed = passed;
        
        [test.executionMessages addObject:message];
        
        if(addedMessage!= nil)
            [[_weakSelf.client.me.messages getById:addedMessage._id] delete:^(int status, MSOrcError *error) {
                
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
        
        result(test);
    }];
}

- (void)testGetMessageOverload:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc:@""];
    newMessage.body = [[MSOutlookItemBody alloc] init];
    newMessage.body.contentType = MSOutlookBodyTypeText;
    
    return [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        [[_weakSelf.client.me messagesById:addedMessage._id] readWithCallback:^(MSOutlookMessage *searchedMessage, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = error == nil && addedMessage!= nil  ? @"Ok - ": @"Not - ";
            
            if(searchedMessage!= nil && [searchedMessage._id isEqualToString:addedMessage._id]){
                passed = true;
            }
            
            test.passed = passed;
            
            [test.executionMessages addObject:message];
            
            if(addedMessage!= nil)
                [[_weakSelf.client.me.messages getById:addedMessage._id] delete:^(int status, MSOrcError *error) {
                    
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            
            result(test);
            
        }];
    }];
}

- (void)testCreateAndSendHtmlMessages:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject Html" to:self.testMail cc:@""];
    newMessage.body.contentType = MSOutlookBodyTypeText;
    newMessage.body.content = @"<div>Html Test</div>";
    
    return [_weakSelf.client.me.operations sendMailWithMessage:newMessage saveToSentItems:true callback:^(int returnValue, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = @"";
        
        
        if(error== nil){
            message = @"Ok - ";
            passed = true;
        }else{
            message = [@"Not - " stringByAppendingString:[error localizedDescription]];
        }
        
        test.passed = passed;
        
        [test.executionMessages addObject:message];
        
        result(test);
        
    }];
}

- (void)testUpdateMessages:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc:@""];
    
    //Create message
    return [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        NSString *updatedSubject = @"My Updated Subject";
        addedMessage.Subject = updatedSubject;
        
        //Update message
        [[_weakSelf.client.me.messages getById:addedMessage._id] update:newMessage callback:^(MSOutlookMessage *updatedMessage, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = error == nil ? @"Ok - ": @"Not - ";
            
            if(updatedMessage!= nil && [updatedMessage.subject isEqualToString:newMessage.subject]) {
                passed = true;
            }
            
            test.passed = passed;
            
            [test.executionMessages addObject:message];
            
            if(updatedMessage!= nil){
                [[_weakSelf.client.me.messages getById:updatedMessage._id] delete:^(int status, MSOrcError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            }
            
            result(test);
        }];
    }];
}

- (void)testDeleteMessages:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc:@""];
    
    return [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        [[_weakSelf.client.me.messages getById:addedMessage._id] delete:^(int status, MSOrcError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = error == nil ? @"Ok - ": @"Not - ";
            
            if(error== nil){
                passed = true;
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            result(test);
        }];
    }];
}

- (void)testMoveMessages:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc:@""];
    
    //Create message
    return [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        //Move message
        [[_weakSelf.client.me.messages getById:addedMessage._id].operations moveWithDestinationId:@"Inbox" callback:^(MSOutlookMessage *movedMessage, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = error == nil ? @"Ok - ": @"Not - ";
            
            if(movedMessage!= nil && [movedMessage.subject isEqualToString:newMessage.subject]){
                passed = true;
            }
            
            test.passed = passed;
            
            [test.executionMessages addObject:message];
            
            //Cleanup
            if(movedMessage!= nil) {
                [[_weakSelf.client.me.messages getById:movedMessage._id] delete:^(int status, MSOrcError *error) {
                    
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            }
            
            result(test);
        }];
    }];
}

- (void)testCopyMessages:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc:@""];
    
    //Create message
    return [_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        //Move message
        [[_weakSelf.client.me.messages getById:addedMessage._id].operations copyWithDestinationId:@"Inbox" callback:^(MSOutlookMessage *copiedMessage, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = error == nil ? @"Ok - ": @"Not - ";
            
            if(copiedMessage!= nil && [copiedMessage.subject isEqualToString:newMessage.subject]){
                passed = true;
            }
            
            test.passed = passed;
            
            [test.executionMessages addObject:message];
            
            //Cleanup
            if(copiedMessage!= nil) {
                [[_weakSelf.client.me.messages getById:copiedMessage._id] delete:^(int status, MSOrcError *error) {
                    
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
                
                [[_weakSelf.client.me.messages getById:addedMessage._id] delete:^(int status, MSOrcError *error) {
                    
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            }
            
            result(test);
        }];
    }];
}

- (void)testSendMessages:(void(^)(Test *))result {
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc:@""];
    
    //Send Mail
    return[_weakSelf.client.me.operations sendMailWithMessage:newMessage saveToSentItems:true callback:^(int returnValue, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = @"";
        
        
        if (error== nil) {
            
            message = @"Ok - ";
            passed = true;
        }
        else {
            message = [@"Not - " stringByAppendingString:[error localizedDescription]];
        }
        
        test.passed = passed;
        
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testSendWithMessageOperations:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.testMail cc:@""];
    
    //Send Mail
    return[_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *message, MSOrcError *e) {
        
        [[_weakSelf.client.me.messages getById:message._id].operations sendWithCallback:^(int returnValue, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = @"";
            
            
            if(error== nil){
                message = @"Ok - ";
                passed = true;
            }else{
                message = [@"Not - " stringByAppendingString:[error localizedDescription]];
            }
            
            test.passed = passed;
            
            [test.executionMessages addObject:message];
            
            result(test);
        }];
    }];
}

- (void)testSendHtmlMessages:(void (^) (Test *))result{
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Html Subject" to:self.testMail cc:@""];
    newMessage.body.content = @"<h1>This is an Html body.</h1><a href='#'>With Link!</a>";
    newMessage.body.contentType = MSOutlookBodyTypeText;
    
    //Send Mail
    return[_weakSelf.client.me.operations sendMailWithMessage:newMessage saveToSentItems:true callback:^(int returnValue, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = @"";
        
        
        if(error== nil){
            message = @"Ok - ";
            passed = true;
        }else{
            message = [@"Not - " stringByAppendingString:[error localizedDescription]];
        }
        
        test.passed = passed;
        
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

- (void)testReplyMessages:(void(^)(Test *))result {
    
    return [[_weakSelf.client.me.messages top:1] readWithCallback:^(NSArray *messages, MSOrcError *error) {
        
        if ([messages count] == 0) {
            
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            test.passed = false;
            [test.executionMessages addObject:@"Not - No available mails to reply"];
            result(test);
        }
        else {
            
            MSOutlookMessage *currentMessage = [messages objectAtIndex:0];
            
            [[_weakSelf.client.me.messages getById:currentMessage._id].operations createReplyWithCallback:^(MSOutlookMessage *replyMessage, MSOrcError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.executionMessages = [NSMutableArray array];
                NSString* message = @"";
                
                if(error == nil && replyMessage != nil){
                    message =@"Ok - ";
                    passed = true;
                }
                else {
                    
                    message = @"Not - ";
                    
                    if(error!=nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                
                //Cleanup
                if(replyMessage!= nil)
                    [[_weakSelf.client.me.messages getById:replyMessage._id] delete:^(int status, MSOrcError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                result(test);
            }];
        }
    }];
}

- (void)testReplyAllMessages:(void(^)(Test *))result {
    
    return [[_weakSelf.client.me.messages top:1] readWithCallback:^(NSArray *messages, MSOrcError *error) {
        
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            test.passed = false;
            [test.executionMessages addObject:@"Not - No available mails to reply all"];
            result(test);
        }
        else{
            MSOutlookMessage *currentMessage = [messages objectAtIndex:0];
            
            [[_weakSelf.client.me.messages getById:currentMessage._id].operations createReplyAllWithCallback:^(MSOutlookMessage *replyAllMessage, MSOrcError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.executionMessages = [NSMutableArray array];
                NSString* message = @"";
                
                if(error == nil && replyAllMessage != nil){
                    message =@"Ok - ";
                    passed = true;
                }else{
                    message = @"Not - ";
                    
                    if(error!=nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                
                //Cleanup
                if(replyAllMessage!= nil)
                    [[_weakSelf.client.me.messages getById:replyAllMessage._id] delete:^(int status, MSOrcError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                result(test);
            }];
        }
    }];
}

- (void)testForwardMessages:(void(^)(Test *))result {
    
    return[[_weakSelf.client.me.messages top:1] readWithCallback:^(NSArray *messages, MSOrcError *error) {
        
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            test.passed = false;
            [test.executionMessages addObject:@"Not - No available mails to reply all"];
            result(test);
        }
        else {
            
            MSOutlookMessage *currentMessage = [messages objectAtIndex:0];
            
            [[_weakSelf.client.me.messages getById:currentMessage._id].operations createForwardWithCallback:^(MSOutlookMessage *fwMessage, MSOrcError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.executionMessages = [NSMutableArray array];
                NSString* message = @"";
                
                if(error == nil && fwMessage != nil){
                    message =@"Ok - ";
                    passed = true;
                }else{
                    message = @"Not - ";
                    if(error!=nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                
                //Cleanup
                if(fwMessage!= nil)
                    [[_weakSelf.client.me.messages getById:fwMessage._id] delete:^(int status, MSOrcError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                result(test);
            }];
        }
    }];
}

- (void)testReplyHtmlMessages:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *messageSubject =[@"My HTML Email" stringByAppendingString:uuid];
    MSOutlookMessage *message = [self getSampleMessage:messageSubject to:self.testMail cc:@"" ];
    message.body.content = @"<h1>This is an Html body.</h1>";
    message.body.contentType = MSOutlookBodyTypeText;
    message.body.contentType = MSOutlookBodyTypeText;
    
    //Send mail with HTML body
    return[_weakSelf.client.me.operations sendMailWithMessage:message saveToSentItems:true callback:^(int returnValue, MSOrcError *error) {
        
        // Get sent mail
        [[_weakSelf.client.me.mailFolders filter:@"DisplayName eq 'Sent Items'"] readWithCallback:^(NSArray *mailFolders, MSOrcError *error) {
            
            MSOutlookMailFolder *sentItemsFolder = [mailFolders objectAtIndex:0];
            
            NSString *filter = [[@"Subject eq '" stringByAppendingString:messageSubject] stringByAppendingString:@"'"];
            
            [[[_weakSelf.client.me.mailFolders getById:sentItemsFolder._id ].messages filter:filter] readWithCallback:^(NSArray *messages, MSOrcError *error) {
                
                if(error == nil && messages.count == 1 && [[[messages objectAtIndex:0] body] contentType] == MSOutlookBodyTypeText){
                    MSOutlookMessage *currentMessage = [messages objectAtIndex:0];
                    
                    //Reply message
                    [[_weakSelf.client.me.messages getById:currentMessage._id].operations replyWithComment:self.testMail callback:^(int returnValue, MSOrcError *error) {
                        
                        BOOL passed = false;
                        
                        Test *test = [Test alloc];
                        
                        test.executionMessages = [NSMutableArray array];
                        NSString* message = @"";
                        if(error == nil){
                            message =@"Ok - ";
                            passed = true;
                        }else{
                            message = @"Not - ";
                            if(error!=nil)
                                message = [message stringByAppendingString:[error localizedDescription]];
                        }
                        
                        test.passed = passed;
                        [test.executionMessages addObject:message];
                        
                        result(test);
                    }];
                }
                else {
                    
                    Test *test = [Test alloc];
                    test.executionMessages = [NSMutableArray array];
                    NSString* message = @"Not - Missing mail in inbox. ";
                    
                    if(error!=nil)
                        message = [message stringByAppendingString:[error localizedDescription]];
                    
                    test.passed = false;
                    [test.executionMessages addObject:message];
                    
                    result(test);
                }
            }];
        }];
    }];
     
}

- (MSOutlookMessage *)getSampleMessage:(NSString*)subject to:(NSString*)to cc:(NSString*)cc {
    
    MSOutlookMessage *message = [[MSOutlookMessage alloc]init];
    //To recipient
    MSOutlookRecipient *toRecipient = [[MSOutlookRecipient alloc] init];
    MSOutlookEmailAddress* email = [[MSOutlookEmailAddress alloc]init];
    
    email.address = to;
    toRecipient.emailAddress = email;
    
    NSMutableArray *toRecipients = [[NSMutableArray alloc]init];
    [toRecipients addObject:toRecipient];
    
    message.ToRecipients = (NSMutableArray *)toRecipients;
    
    //Cc recipient
    if (![cc isEqualToString:@""]) {
        
        MSOutlookRecipient *ccRecipient = [[MSOutlookRecipient alloc] init];
        MSOutlookEmailAddress* emailCc = [[MSOutlookEmailAddress alloc]init];
        emailCc.address = cc;
        ccRecipient.emailAddress = emailCc;
        
        NSMutableArray *ccRecipients = [[NSMutableArray alloc]init];
        
        [toRecipients addObject:ccRecipient];
        message.toRecipients = ccRecipients;
    }
    
    //Body & Subject
    message.Subject = subject;
    
    MSOutlookItemBody *body = [[MSOutlookItemBody alloc]init];
    body.Content = @"This is the email body";
    message.Body = body;
    
    return message;
}

#pragma mark ContactTests

- (void)testGetContactFolder:(void(^)(Test *))result {
    
    return [[_weakSelf.client.me.contactFolders getById: @"Contacts"].contacts readWithCallback:^(NSArray *contacts, MSOrcError *error) {
        
        BOOL passed = false;
        Test *test = [Test alloc];
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = (error != nil || contacts == nil) ? @"Not - " : @"Ok - ";
        [test.executionMessages addObject:message];
        
        if(error != nil){
            [test.executionMessages addObject: [error localizedDescription]];
        }
        
        if(contacts != nil){
            passed = true;
        }
        
        test.passed = passed;
        
        result(test);
    }];
    
}

- (void)testGetContacts:(void(^)(Test *))result {
    MSOutlookContact* newContact = [self getContact];
    
    //Create contact
    return [_weakSelf.client.me.contacts add:newContact callback:^(MSOutlookContact *addedContact, MSOrcError *e) {
        
        //Get contacts
        [_weakSelf.client.me.contacts readWithCallback:^(NSArray* contacts, MSOrcError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = (error!= nil || contacts == nil) ? @"Not - " : @"Ok - ";
            [test.executionMessages addObject:message];
            
            if(error != nil){
                [test.executionMessages addObject: [error localizedDescription]];
            }
            
            if(contacts != nil && [contacts count] != 0){
                passed = true;
            }
            
            test.passed = passed;
            
            //Cleanup
            if(addedContact!= nil)
                [[_weakSelf.client.me.contacts getById:addedContact._id] delete:^(int status, MSOrcError * e) {
                    if(e!=nil)
                        NSLog(@"Error: %@", e);
                }];
            
            result(test);
        }];
    }];
}

- (void)testCreateContacts:(void(^)(Test *))result {
    
    MSOutlookContact* newContact = [self getContact];
    
    //Create contact
    return [_weakSelf.client.me.contacts add:newContact callback:^(MSOutlookContact *addedContact, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        test.executionMessages = [NSMutableArray array];
        
        NSString* message = (error!= nil || addedContact == nil) ? @"Not - " : @"Ok - ";
        [test.executionMessages addObject:message];
        
        if(error != nil){
            [test.executionMessages addObject: [error localizedDescription]];
        }
        
        if(addedContact != nil && [addedContact.displayName isEqualToString: newContact.displayName]){
            passed = true;
        }
        
        test.passed = passed;
        
        //Cleanup
        if(addedContact!= nil)
            [[_weakSelf.client.me.contacts getById:addedContact._id] delete:^(int status, MSOrcError * error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
        
        result(test);
    }];
}

- (void)testDeleteContacts:(void(^)(Test *))result {
    
    MSOutlookContact* newContact = [self getContact];
    
    //Create contact
    return [_weakSelf.client.me.contacts add:newContact callback:^(MSOutlookContact *addedContact, MSOrcError *e) {
        
        //Delete
        [[_weakSelf.client.me.contacts getById:addedContact._id] delete:^(int status, MSOrcError * error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = (error!= nil) ? @"Not - " : @"Ok - ";
            [test.executionMessages addObject:message];
            
            if(error != nil){
                [test.executionMessages addObject: [error localizedDescription]];
            }else{
                passed = true;
            }
            
            test.passed = passed;
            result(test);
        }];
    }];
}

- (void)testUpdateContacts:(void(^)(Test *))result {
    
    MSOutlookContact* newContact = [self getContact];
    
    //Create contact
    return [_weakSelf.client.me.contacts add:newContact callback:^(MSOutlookContact *addedContact, MSOrcError *error) {
        
        newContact.displayName = @"New Contact Name";
        
        [[_weakSelf.client.me.contacts getById:addedContact._id] update:newContact callback:^(MSOutlookContact *updatedEntity, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            
            NSString* message = (error!= nil || updatedEntity == nil) ? @"Not - " : @"Ok - ";
            [test.executionMessages addObject:message];
            
            if(error != nil){
                [test.executionMessages addObject: [error localizedDescription]];
            }
            
            if(updatedEntity != nil && updatedEntity.displayName != addedContact.displayName){
                passed = true;
            }
            
            test.passed = passed;
            
            //Cleanup
            if(updatedEntity!= nil)
                [[_weakSelf.client.me.contacts getById:updatedEntity._id] delete:^(int status, MSOrcError * error) {
                    
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            
            result(test);
        }];
    }];
}

-(MSOutlookContact *) getContact{
    
    MSOutlookContact* contact = [[MSOutlookContact alloc]init];
    contact.displayName = @"Test Contact";
    contact.givenName = @"Test Contact Name";
    
    MSOutlookEmailAddress *email = [[MSOutlookEmailAddress alloc]init];
    email.address = @"test@test.com";
    
    NSMutableArray *list = [[NSMutableArray alloc] init];
    [list addObject:email];
    
    contact.emailAddresses = list;
    
    return contact;
}

#pragma mark CalendarGroupTests

- (void)testGetCalendarGroups:(void(^)(Test *))result {
    
    return [_weakSelf.client.me.calendarGroups readWithCallback:^(NSArray *calendarGroups, MSOrcError *error) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
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
        
        test.passed = passed;
        
        [test.executionMessages addObject:message];
        result(test);
    }];
}

- (void)testCreateCalendarGroups:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    
    MSOutlookCalendarGroup *newCalendarGroup = [[MSOutlookCalendarGroup alloc] init];
    newCalendarGroup.name = calendarGroupName;
    
    return [_weakSelf.client.me.calendarGroups add:newCalendarGroup callback:^(MSOutlookCalendarGroup *addedCalendarGroup, MSOrcError *e) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
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
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        //Cleanup
        [[_weakSelf.client.me.calendarGroups getById:addedCalendarGroup._id] delete:^(int status, MSOrcError *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }];
        
        result(test);
    }];
}

- (void)testGetCalendarGroupById:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    
    MSOutlookCalendarGroup *newCalendarGroup = [[MSOutlookCalendarGroup alloc] init];
    newCalendarGroup.name = calendarGroupName;
    
    //Create calendar group
    return [_weakSelf.client.me.calendarGroups add:newCalendarGroup callback:^(MSOutlookCalendarGroup *addedCalendarGroup, MSOrcError *e) {
        
        //Get by id
        [[_weakSelf.client.me.calendarGroups getById:addedCalendarGroup._id] readWithCallback:^(MSOutlookCalendarGroup *calendarGroup, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
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
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            //Cleanup
            [[_weakSelf.client.me.calendarGroups getById:calendarGroup._id] delete:^(int status, MSOrcError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
        }];
    }];
}

- (void)testUpdateCalendarGroups:(void(^)(Test *))result  {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    NSString *updatedCalendarGroupName = [@"Updated" stringByAppendingString:calendarGroupName];
    
    MSOutlookCalendarGroup *newCalendarGroup = [[MSOutlookCalendarGroup alloc] init];
    newCalendarGroup.name = calendarGroupName;
    
    // Create Calendar
    return [_weakSelf.client.me.calendarGroups add:newCalendarGroup callback:^(MSOutlookCalendarGroup *addedCalendarGroup, MSOrcError *e) {
        
        newCalendarGroup.name = updatedCalendarGroupName;
        
        //Update Calendar Group
        [[_weakSelf.client.me.calendarGroups getById:addedCalendarGroup._id] update:newCalendarGroup callback:^(MSOutlookCalendarGroup *updatedCalendarGroup, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            
            if(e== nil && updatedCalendarGroup != nil && [updatedCalendarGroup.name isEqualToString:updatedCalendarGroupName] ){
                message = @"Ok - ";
                passed = true;
            }else
            {
                message = @"Not - ";
                if(e != nil)
                    message = [message stringByAppendingString:[e localizedDescription]];
            }
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            //Cleanup
            [[_weakSelf.client.me.calendarGroups getById:updatedCalendarGroup._id] delete:^(int status, MSOrcError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
            
        }];
    }];
}

- (void)testDeleteCalendarGroups:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarGroupName = [@"NewCalendarGroup" stringByAppendingString:uuid];
    
    MSOutlookCalendarGroup *newCalendarGroup = [[MSOutlookCalendarGroup alloc] init];
    newCalendarGroup.name = calendarGroupName;
    
    //Create Calendar
    return [_weakSelf.client.me.calendarGroups add:newCalendarGroup callback:^(MSOutlookCalendarGroup *addedCalendarGroup, MSOrcError *e) {
        
        //Delete Calendar
        [[_weakSelf.client.me.calendarGroups getById:addedCalendarGroup._id] delete:^(int status, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
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
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            result(test);
            
        }];
    }];
}

#pragma mark CalendarTests

- (void)testGetCalendars:(void(^)(Test *))result {
    
    return [_weakSelf.client.me.calendars readWithCallback:^(NSArray *calendars, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
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
        
        test.passed = passed;
        
        [test.executionMessages addObject:message];
        result(test);
    }];
}

- (void)testGetDefaultCalendar:(void(^)(Test *))result {
    
    return [_weakSelf.client.me.calendar readWithCallback:^(MSOutlookCalendar *calendar, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
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
        
        test.passed = passed;
        
        [test.executionMessages addObject:message];
        result(test);
    }];
}

- (void)testCreateCalendar:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    
    MSOutlookCalendar *newCalendar = [[MSOutlookCalendar alloc] init];
    newCalendar.name = calendarName;
    
    return [_weakSelf.client.me.calendars add:newCalendar callback:^(MSOutlookCalendar *addedCalendar, MSOrcError *e) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
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
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        //Cleanup
        [[_weakSelf.client.me.calendars getById:addedCalendar._id] delete:^(int status, MSOrcError *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }];
        
        result(test);
    }];
}

- (void)testGetCalendarById:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    
    MSOutlookCalendar *newCalendar = [[MSOutlookCalendar alloc] init];
    newCalendar.name = calendarName;
    
    //Create calendar
    return [_weakSelf.client.me.calendars add:newCalendar callback:^(MSOutlookCalendar *addedCalendar, MSOrcError *e) {
        
        //Get by id
        [[_weakSelf.client.me.calendars getById:addedCalendar._id] readWithCallback:^(MSOutlookCalendar *calendar, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
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
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            //Cleanup
            [[_weakSelf.client.me.calendars getById:calendar._id] delete:^(int status, MSOrcError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
        }];
    }];
}

- (void)testUpdateCalendar:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    NSString *updatedCalendarName = [@"Updated" stringByAppendingString:calendarName];
    
    MSOutlookCalendar *newCalendar = [[MSOutlookCalendar alloc] init];
    newCalendar.name = calendarName;
    
    // Create Calendar
    return [_weakSelf.client.me.calendars add:newCalendar callback:^(MSOutlookCalendar *addedCalendar, MSOrcError *e) {
        
        newCalendar.Name = updatedCalendarName;
        
        //Update Calendar
        [[_weakSelf.client.me.calendars getById:addedCalendar._id] update:newCalendar callback:^(MSOutlookCalendar *updatedCalendar, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
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
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            //Cleanup
            [[_weakSelf.client.me.calendars getById:updatedCalendar._id] delete:^(int status, MSOrcError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
            
        }];
    }];
}

- (void)testDeleteCalendar:(void(^)(Test *))result {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *calendarName = [@"NewCalendar" stringByAppendingString:uuid];
    
    MSOutlookCalendar *newCalendar = [[MSOutlookCalendar alloc] init];
    newCalendar.name = calendarName;
    
    //Create Calendar
    return [_weakSelf.client.me.calendars add:newCalendar callback:^(MSOutlookCalendar *addedCalendar, MSOrcError *e) {
        
        //Delete Calendar
        [[_weakSelf.client.me.calendars getById:addedCalendar._id] delete:^(int status, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
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
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            result(test);
            
        }];
    }];
}

- (void)testGetCalendarView:(void(^)(Test *))result {
    
    MSOutlookEvent *newEvent = [self getSampleEvent];
    
    return[_weakSelf.client.me.events add:newEvent callback:^(MSOutlookEvent *addedEvent, MSOrcError *e) {
        
        NSDate *start = [MSOCalendarSerializer deserialize:addedEvent.start.dateTime];
        NSDate *end = [MSOCalendarSerializer deserialize:addedEvent.end.dateTime];
        
        [[[_weakSelf.client.me.calendarView addCustomParametersWithName:@"startdatetime" value:start] addCustomParametersWithName:@"enddatetime" value:end ] readWithCallback:^(NSArray *events, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
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
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            //Cleanup
            [[_weakSelf.client.me.events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
                
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
        }];
    }];
}

#pragma mark EventTests

- (void)testGetEvents:(void(^)(Test *))result {
    
    MSOutlookEvent *event = [self getSampleEvent];
    
    //Create Event
    return [_weakSelf.client.me.events add:event callback:^(MSOutlookEvent *addedEvent, MSOrcError *e) {
        //Get Events
        [_weakSelf.client.me.events readWithCallback:^(NSArray *events, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            
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
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            //Cleanup
            [[_weakSelf.client.me.events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
        }];
    }];
}

- (void)testCreateEvents:(void(^)(Test *))result {
    
    MSOutlookEvent *event = [self getSampleEvent];
    //Create Event
    return [_weakSelf.client.me.events add:event callback:^(MSOutlookEvent *addedEvent, MSOrcError *e) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
        NSString* message =  @"";
        
        if(e == nil && addedEvent != nil ){
            message =  @"Ok - ";
            passed = true;
        }
        else {
            
            message =@"Not - ";
            
            if(e!= nil)
                message = [message stringByAppendingString:[e localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        //Cleanup
        [[_weakSelf.client.me.events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }];
        
        result(test);
    }];
}

- (void)testUpdateEvents:(void(^)(Test *))result {
    
    MSOutlookEvent *event = [self getSampleEvent];
    
    //Create Event
    return [_weakSelf.client.me.events add:event callback:^(MSOutlookEvent *addedEvent, MSOrcError *e) {
        
        NSString *updatedSubject = [@"Updated" stringByAppendingString:event.subject];
        event.subject = updatedSubject;
        
        // Update Event
        [[_weakSelf.client.me.events getById:addedEvent._id] update:event callback:^(MSOutlookEvent *updatedEvent, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            
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
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            //Cleanup
            [[_weakSelf.client.me.events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
        }];
    }];
}

- (void)testDeleteEvents:(void(^)(Test *))result {
    
    MSOutlookEvent *event = [self getSampleEvent];
    
    //Create Event
    return [_weakSelf.client.me.events add:event callback:^(MSOutlookEvent *addedEvent, MSOrcError *e) {
        
        //Delete event
        [[_weakSelf.client.me.events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            
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
            
            test.passed = passed;
            [test.executionMessages addObject:message];
            
            result(test);
        }];
    }];
}

- (void)testCreateMessageWithAttachment:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"Test Attachment" to:self.testMail cc:@""];
    
    return[_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        if(addedMessage!= nil && [addedMessage.subject isEqualToString:newMessage.subject]){
            
            MSOutlookFileAttachment* attachment = [[MSOutlookFileAttachment alloc] init];
            
            attachment.contentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
            attachment.name = @"TestAttachments.txt";
            
            [[_weakSelf.client.me.messages getById:addedMessage._id].attachments add:attachment callback:^(MSOutlookAttachment *a, MSOrcError *e) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.executionMessages = [NSMutableArray array];
                
                NSString* message =  @"";
                
                if(error == nil && a != nil && [a.name isEqualToString: attachment.name]){
                    message =  @"Ok - ";
                    passed = true;
                }
                else{
                    message =@"Not - ";
                    if(e!= nil)
                        message = [message stringByAppendingString:[e localizedDescription]];
                }
                
                test.passed = passed;
                [test.executionMessages addObject:message];
                
                result(test);
            }];
        }
    }];
}

- (void)testGetAttachment:(void(^)(Test *))result {
    
    MSOutlookMessage *newMessage = [self getSampleMessage:@"Test Attachment" to:self.testMail cc:@""];
    
    return[_weakSelf.client.me.messages add:newMessage callback:^(MSOutlookMessage *addedMessage, MSOrcError *error) {
        
        if(addedMessage!= nil && [addedMessage.subject isEqualToString:newMessage.subject]){
            
            MSOutlookFileAttachment* attachment = [[MSOutlookFileAttachment alloc] init];
            
            attachment.contentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
            attachment.name = @"TestAttachments.txt";
            
            [[_weakSelf.client.me.messages getById:addedMessage._id].attachments add:attachment callback:^(MSOutlookAttachment *a, MSOrcError *e) {
                
                [[[[_weakSelf.client.me.messages getById:addedMessage._id].attachments getById:a._id] asFileAttachment] readWithCallback:^(MSOutlookFileAttachment *fileAttachment, MSOrcError *error) {
                    
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    
                    test.executionMessages = [NSMutableArray array];
                    
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
                    
                    test.passed = passed;
                    [test.executionMessages addObject:message];
                    
                    result(test);
                }];
            }];
        }
    }];
}


- (MSOutlookEvent *)getSampleEvent {
    
    MSOutlookEvent *event= [[MSOutlookEvent alloc]init];
    event.subject = @"Today's appointment";
    
    event.start = [[MSOutlookDateTimeTimeZone alloc] init];
    event.start.dateTime = [MSOrcObjectizer stringFromDate:[NSDate date]];
    event.start.timeZone = @"UTC";
    
    event.end = [[MSOutlookDateTimeTimeZone alloc] init];
    event.end.dateTime = [MSOrcObjectizer stringFromDate:[[NSDate date] dateByAddingTimeInterval: 3600]];
    event.end.timeZone = @"UTC";
    
    MSOutlookImportance importance = MSOutlookImportanceHigh;
    event.importance = importance;
    
    //Event Body
    MSOutlookItemBody *itemBody = [[MSOutlookItemBody alloc] init];
    itemBody.content = @"This is the appointment info";
    
    MSOutlookBodyType bt = MSOutlookBodyTypeText;
    itemBody.contentType = bt;
    event.body = itemBody;
    
    // Attendees
    MSOutlookAttendee *attendee1 = [[MSOutlookAttendee alloc]init];
    MSOutlookEmailAddress *email = [[MSOutlookEmailAddress alloc]init];
    
    email.address = self.testMail;
    attendee1.emailAddress = email;
    
    NSMutableArray *attendees = [[NSMutableArray alloc] init];
    [attendees addObject:attendee1];
    
    event.attendees = (NSMutableArray *)attendees;
    
    return event;

}

@end