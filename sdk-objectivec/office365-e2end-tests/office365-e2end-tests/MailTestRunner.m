/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MailTestRunner.h"
#import "TestParameters.h"
#import "Test.h"
#import <office365_exchange_sdk/MSOutlookFolderCollectionFetcher.h>
#import <office365_exchange_sdk/MSOutlookMessageCollectionFetcher.h>
#import <office365_exchange_sdk/MSOutlookContactFolderCollectionFetcher.h>
#import <office365_exchange_sdk/MSOutlookContactCollectionFetcher.h>
#import <office365_exchange_sdk/MSOutlookCalendarGroupCollectionFetcher.h>
#import <office365_exchange_sdk/MSOutlookCalendarCollectionFetcher.h>
#import <office365_exchange_sdk/MSOutlookEventCollectionFetcher.h>
#import <office365_exchange_sdk/MSOutlookContactFetcher.h>
#import <office365_exchange_sdk/MSOutlookFolderFetcher.h>
#import <office365_exchange_sdk/MSOutlookFileAttachment.h>
#import <office365_exchange_sdk/MSOutlookAttachmentCollectionFetcher.h>

@implementation MailTestRunner

-(id)initWithClient : (MSOutlookClient*)client{
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
    if([testName isEqualToString: @"TestSkip"]) return [self TestSkip:result];
    if([testName isEqualToString: @"TestOrderBy"]) return [self TestOrderBy:result];
    
    // Contacts Tests
    if([testName isEqualToString:@"TestGetContactFolder"]) return [self TestGetContactFolder:result];
    if([testName isEqualToString:@"TestGetContacts"]) return [self TestGetContacts:result];
    if([testName isEqualToString:@"TestCreateContacts"]) return [self TestCreateContacts:result];
    if([testName isEqualToString:@"TestDeleteContacts"]) return [self TestDeleteContacts:result];
    if([testName isEqualToString:@"TestUpdateContacts"]) return [self TestUpdateContacts:result];
    
    //Mail Tests
    if([testName isEqualToString:@"TestGetMessages"]) return [self TestGetMessages:result];
    if([testName isEqualToString:@"TestCreateMessages"])return [self TestCreateMessages:result];
    if([testName isEqualToString:@"TestCreateHtmlMessages"])return [self TestCreateAndSendHtmlMessages:result];
    if([testName isEqualToString:@"TestCreateMessageWithAttachment"])return [self TestCreateMessageWithAttachment:result];
    if([testName isEqualToString:@"TestGetAttachment"])return [self TestGetAttachment:result];
    if([testName isEqualToString:@"TestUpdateMessages"])return [self TestUpdateMessages:result];
    if([testName isEqualToString:@"TestDeleteMessages"])return [self TestDeleteMessages:result];
    if([testName isEqualToString:@"TestMoveMessages"])return [self TestMoveMessages:result];
    if([testName isEqualToString:@"TestCopyMessages"])return [self TestMoveMessages:result];
    if([testName isEqualToString:@"TestSendMessages"])return [self TestSendMessages:result];
    if([testName isEqualToString:@"TestSendHtmlMessages"])return [self TestSendHtmlMessages:result];
    if([testName isEqualToString:@"TestReplyMessages"])return [self TestReplyMessages:result];
    if([testName isEqualToString:@"TestReplyAllMessages"])return [self TestReplyAllMessages:result];
    if([testName isEqualToString:@"TestForwardMessages"])return [self TestForwardMessages:result];
    if([testName isEqualToString:@"TestReplyHtmlMessages"])return [self TestReplyHtmlMessages:result];
    
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

-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUser" :@"Get User" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestTop" :@"Can use top" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestFilterWithTop" :@"Can use filter with top" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSelect" :@"Can use select with top" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSkip" :@"Can use skip" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestOrderBy" :@"Can use order by" ]];
    
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
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateHtmlMessages" :@"Create and Send Html message in drafts" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateMessages" :@"Update message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteMessages" :@"Delete message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestMoveMessages" :@"Move message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCopyMessages" :@"Copy message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSendMessages" :@"Send message" ]];
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

// ****** General Tests *******

-(NSURLSessionDataTask*)TestGetUser:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self.Client getMe] read:^(MSOutlookUser *user, MSODataException *error) {
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
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage withCallback :^(MSOutlookMessage *addedMessage, MSODataException *error) {
        [[[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage2, MSODataException *e) {
            
            [[[[[self.Client getMe]getMessages]top:1]read:^(NSArray<MSOutlookMessage> *messages, MSODataException *error) {
                
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
                    [[[[[self.Client getMe]getMessages]getById:addedMessage.Id]deleteMessage :^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                if(addedMessage2!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage2.Id]deleteMessage:^(int status, MSODataException *error) {
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
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage, MSODataException *error) {
        [[[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage2, MSODataException *e) {
            
            [[[[[[[[self.Client getMe] getFolders] getById:@"Drafts"]getMessages]filter:@"Subject eq 'My Subject'"]top:1]read:^(NSArray<MSOutlookMessage> *messages, MSODataException *error) {
                
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
                    [[[[[self.Client getMe]getMessages]getById:addedMessage.Id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                if(addedMessage2!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage2.Id]deleteMessage:^(int status, MSODataException *error) {
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
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage, MSODataException *error) {
        [[[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage2, MSODataException *e) {
            
            [[[[[[self.Client getMe]getMessages]select:@"Subject"]top:1] read:^(NSArray<MSOutlookMessage> *messages, MSODataException *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                
                test.ExecutionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                MSOutlookMessage *current =(messages!= nil && [messages count] == 1) ?[messages objectAtIndex:0] : nil;
                
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
                    [[[[[self.Client getMe]getMessages]getById:addedMessage.Id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                if(addedMessage2!= nil)
                    [[[[[self.Client getMe]getMessages]getById:addedMessage2.Id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }]resume];
            
        }]resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestSkip:(void (^) (Test*))result{
    MSOutlookContact* contact1 = [self getContact];
    NSString *contact1Name = [@"AA" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    [contact1 setDisplayName:contact1Name];
    
    MSOutlookContact* contact2 = [self getContact];
    NSString *contact2Name = [@"BB" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    [contact2 setDisplayName:contact2Name];
    
    //Create contact1
    NSURLSessionDataTask *task = [[[self.Client getMe] getContacts] addContact:contact1 withCallback:^(MSOutlookContact *addedContact1, MSODataException *error) {
        // Create contact2
        [[[[self.Client getMe]getContacts]addContact:contact2 withCallback:^(MSOutlookContact *addedContact2, MSODataException *e) {
            //Test order by
            NSString *filter = [@"" stringByAppendingFormat:@"DisplayName eq '%@' or DisplayName eq '%@'", contact1Name, contact2Name ];
            
            
            [[[[[[[self.Client getMe] getContacts ] filter:filter] orderBy:@"DisplayName Desc"] skip:1] read:^(NSArray<MSOutlookContact> *contacts, MSODataException *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                test.ExecutionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                
                if(error == nil && [contacts count] == 1 && [[[contacts objectAtIndex:0] DisplayName] isEqualToString:contact1Name] ){
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
                    [[[[[self.Client getMe] getContacts] getById:addedContact1.Id] deleteContact:^(int status, MSODataException * error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }] resume];
                
                if(addedContact2!= nil)
                    [[[[[self.Client getMe] getContacts] getById:addedContact2.Id] deleteContact:^(int status, MSODataException * error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }] resume];
                result(test);
                
            }] resume];
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestOrderBy:(void (^) (Test*))result{
    MSOutlookContact* contact1 = [self getContact];
    NSString *contact1Name = [@"AA" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    [contact1 setDisplayName:contact1Name];
    
    MSOutlookContact* contact2 = [self getContact];
    NSString *contact2Name = [@"BB" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    [contact2 setDisplayName:contact2Name];
    
    //Create contact1
    NSURLSessionDataTask *task = [[[self.Client getMe] getContacts] addContact:contact1 withCallback:^(MSOutlookContact *addedContact1, MSODataException *error) {
        // Create contact2
        [[[[self.Client getMe]getContacts]addContact:contact2 withCallback:^(MSOutlookContact *addedContact2, MSODataException *e) {
            //Test order by
            NSString *filter = [@"" stringByAppendingFormat:@"DisplayName eq '%@' or DisplayName eq '%@'", contact1Name, contact2Name ];
            
            // Get contacts Desc
            [[[[[[self.Client getMe] getContacts ] filter:filter] orderBy:@"DisplayName Desc"] read:^(NSArray<MSOutlookContact> *contactsDesc, MSODataException *error) {
                //Get contacts Asc
                [[[[[[self.Client getMe] getContacts] filter:filter] orderBy:@"DisplayName Asc"] read:^(NSArray<MSOutlookContact> *contactsAsc, NSError *error) {
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    test.ExecutionMessages = [NSMutableArray array];
                    
                    NSString* message = @"";
                    
                    if(error == nil && [contactsAsc count] == 2 && [contactsDesc count] == 2 && [[[contactsAsc objectAtIndex:0] DisplayName] isEqualToString:contact1Name] && [[[contactsDesc objectAtIndex:0] DisplayName] isEqualToString:contact2Name]){
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
                        [[[[[self.Client getMe] getContacts] getById:addedContact1.Id] deleteContact:^(int status, MSODataException * error) {
                            if(error!= nil)
                                NSLog(@"Error: %@", error);
                        }] resume];
                    
                    if(addedContact2!= nil)
                        [[[[[self.Client getMe] getContacts] getById:addedContact2.Id] deleteContact:^(int status, MSODataException * error) {
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

//******* Folder Tests **********

-(NSURLSessionDataTask*)TestGetFolders:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[self.Client getMe] getFolders] read:^(NSArray<MSOutlookFolder> *folders, MSODataException *error) {
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
    
    NSURLSessionDataTask *task = [[[[self.Client getMe] getFolders] getById:@"Inbox"] read:^(MSOutlookFolder *folder, MSODataException *error) {
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
    
    MSOutlookFolder *newFolder = [[MSOutlookFolder alloc] init];
    [newFolder setDisplayName:folderName];
    
    NSURLSessionDataTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] addFolder:newFolder withCallback:^(MSOutlookFolder *folder, MSODataException *e) {
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
    
    MSOutlookFolder *newFolder = [[MSOutlookFolder alloc] init];
    [newFolder setDisplayName:folderName];
    
    //Create folder
    NSURLSessionDataTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] addFolder:newFolder withCallback:^(MSOutlookFolder *folder, MSODataException *e) {
        [[[[[self.Client getMe] getFolders] getById:newFolder.Id] deleteFolder:^(int status, MSODataException *error) {
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
    
    MSOutlookFolder *newFolder = [[MSOutlookFolder alloc] init];
    [newFolder setDisplayName:folderName];
    
    NSURLSessionDataTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] addFolder:newFolder withCallback:^(MSOutlookFolder *addedFolder, MSODataException *e) {
        [[[[[[self.Client getMe] getFolders]getById:addedFolder.Id] getOperations] move:@"Drafts" :^(MSOutlookFolder *folder, MSODataException *error) {
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
                [[[[[self.Client getMe]getFolders]getById:folder.Id]deleteFolder:^(int status, MSODataException *error) {
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
    
    MSOutlookFolder *newFolder = [[MSOutlookFolder alloc] init];
    [newFolder setDisplayName:folderName];
    
    NSURLSessionDataTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] addFolder:newFolder withCallback:^(MSOutlookFolder *addedFolder, MSODataException *e) {
        [[[[[[self.Client getMe] getFolders]getById:addedFolder.Id] getOperations] copy:@"Drafts" :^(MSOutlookFolder *copiedFolder, MSODataException *error) {
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
                [[[[[self.Client getMe]getFolders]getById:copiedFolder.Id]deleteFolder:^(int status, MSODataException *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }] resume];
            }
            
            [[[[[self.Client getMe]getFolders]getById:addedFolder.Id]deleteFolder:^(int status, MSODataException *error) {
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
    
    MSOutlookFolder *newFolder = [[MSOutlookFolder alloc] init];
    [newFolder setDisplayName:folderName];
    
    NSURLSessionDataTask* task =[[[[[self.Client getMe] getFolders] getById:@"Inbox"] getChildFolders] addFolder:newFolder withCallback:^(MSOutlookFolder *addedFolder, MSODataException *e) {
        NSString *updatedFolderName = [@"Updated" stringByAppendingString:folderName];
        [newFolder setDisplayName:updatedFolderName];
        [[[[[self.Client getMe]getFolders]getById:addedFolder.Id]updateFolder:newFolder withCallback:^(MSOutlookFolder *updatedFolder, MSODataException *error) {
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
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] read:^(NSArray<MSOutlookMessage> *messages, MSODataException *error) {
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
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    newMessage.Body = [[MSOutlookItemBody alloc] init];
    newMessage.Body.ContentType = Text;
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage, MSODataException *error) {
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
            [[[[[self.Client getMe]getMessages]getById:addedMessage.Id]deleteMessage:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCreateAndSendHtmlMessages:(void (^) (Test*))result{
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject Html" : self.TestMail : @""];
    newMessage.Body.ContentType = HTML;//[MSOutlookBodyType1 alloc];//(MSOutlookBodyType).HTML;
    newMessage.Body.Content = @"<div>Html Test</div>";
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage, MSODataException *error) {
        [[[[self.Client getMe] getOperations] sendMail:newMessage :true :^(int returnValue, MSODataException *error) {
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

-(NSURLSessionDataTask*)TestUpdateMessages:(void (^) (Test*))result{
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    //Create message
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage, MSODataException *error) {
        NSString *updatedSubject = @"My Updated Subject";
        [newMessage setSubject:updatedSubject];
        //Update message
        [[[[[self.Client getMe]getMessages]getById:addedMessage.Id]updateMessage:newMessage withCallback:^(MSOutlookMessage *updatedMessage, MSODataException *error) {
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
                [[[[[self.Client getMe]getMessages]getById:updatedMessage.Id]deleteMessage:^(int status, MSODataException *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestDeleteMessages:(void (^) (Test*))result{
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage, MSODataException *error) {
        [[[[[self.Client getMe] getMessages] getById:addedMessage.Id]deleteMessage:^(int status, MSODataException *error) {
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
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    //Create message
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage, MSODataException *error) {
        //Move message
        [[[[[[self.Client getMe]getMessages]getById:addedMessage.Id]getOperations]move:@"Inbox" :^(MSOutlookMessage *movedMessage, MSODataException *error) {
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
                [[[[[self.Client getMe]getMessages]getById:movedMessage.Id]deleteMessage:^(int status, MSODataException *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestSendMessages:(void (^) (Test*))result{
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    //Send Mail
    NSURLSessionDataTask* task = [[[self.Client getMe] getOperations] sendMail:newMessage :true :^(int returnValue, MSODataException *error) {
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

-(NSURLSessionDataTask*)TestSendHtmlMessages:(void (^) (Test*))result{
    MSOutlookMessage *newMessage = [self getSampleMessage:@"My Html Subject" : self.TestMail : @""];
    [newMessage.Body setContent:@"<h1>This is an Html body.</h1><a href='#'>With Link!</a>"];
    [newMessage.Body setContentType: HTML];
    
    //Send Mail
    NSURLSessionDataTask* task = [[[self.Client getMe] getOperations] sendMail:newMessage :true :^(int returnValue, MSODataException *error) {
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
    
    NSURLSessionDataTask* task = [[[[self.Client getMe] getMessages] top:1] read:^(NSArray<MSOutlookMessage> *messages, MSODataException *error) {
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            test.Passed = false;
            [test.ExecutionMessages addObject:@"Not - No available mails to reply"];
            result(test);
        }else{
            MSOutlookMessage *currentMessage = [messages objectAtIndex:0];
            [[[[[[self.Client getMe]getMessages]getById:currentMessage.Id]getOperations]createReply:^(MSOutlookMessage *replyMessage, MSODataException *error) {
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
                    [[[[[self.Client getMe]getMessages]getById:replyMessage.Id]deleteMessage:^(int status, MSODataException *error) {
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
    
    NSURLSessionDataTask* task = [[[[self.Client getMe] getMessages] top:1] read:^(NSArray<MSOutlookMessage> *messages, MSODataException *error) {
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            test.Passed = false;
            [test.ExecutionMessages addObject:@"Not - No available mails to reply all"];
            result(test);
        }else{
            MSOutlookMessage *currentMessage = [messages objectAtIndex:0];
            [[[[[[self.Client getMe]getMessages]getById:currentMessage.Id]getOperations]createReplyAll:^(MSOutlookMessage *replyAllMessage, MSODataException *error) {
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
                    [[[[[self.Client getMe]getMessages]getById:replyAllMessage.Id]deleteMessage:^(int status, MSODataException *error) {
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
    
    NSURLSessionDataTask* task = [[[[self.Client getMe] getMessages] top:1] read:^(NSArray<MSOutlookMessage> *messages, MSODataException *error) {
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.ExecutionMessages = [NSMutableArray array];
            test.Passed = false;
            [test.ExecutionMessages addObject:@"Not - No available mails to reply all"];
            result(test);
        }else{
            MSOutlookMessage *currentMessage = [messages objectAtIndex:0];
            [[[[[[self.Client getMe]getMessages]getById:currentMessage.Id]getOperations]createForward:^(MSOutlookMessage *fwMessage, MSODataException *error) {
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
                    [[[[[self.Client getMe]getMessages]getById:fwMessage.Id]deleteMessage:^(int status, MSODataException *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }]resume];
                
                result(test);
            }] resume];
        }
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestReplyHtmlMessages:(void (^) (Test*))result{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *messageSubject =[@"My HTML Email" stringByAppendingString:uuid];
    MSOutlookMessage *message = [self getSampleMessage:messageSubject :self.TestMail :@"" ];
    [message.Body setContent:@"<h1>This is an Html body.</h1>"];
    [message.Body setContentType: HTML];
    
    //Send mail with HTML body
    NSURLSessionDataTask* task = [[[self.Client getMe] getOperations]sendMail:message :true                                                                          :^(int returnValue, MSODataException *error) {
        // Get sent mail
        [[[[[self.Client getMe] getFolders] filter:@"DisplayName eq 'Sent Items'"] read:^(NSArray<MSOutlookFolder> *folders, MSODataException *error) {
            MSOutlookFolder *sentItemsFolder = [folders objectAtIndex:0];
            [[[[[[[self.Client getMe] getFolders] getById:sentItemsFolder.Id ] getMessages] filter: [[@"Subject eq '" stringByAppendingString:messageSubject] stringByAppendingString:@"'"]]read:^(NSArray<MSOutlookMessage> *messages, MSODataException *error) {
                if(error == nil && messages.count == 1 && [[[messages objectAtIndex:0] Body] ContentType] == HTML){
                    MSOutlookMessage *currentMessage = [messages objectAtIndex:0];
                    //Reply message
                    [[[[[[self.Client getMe] getMessages] getById:currentMessage.Id] getOperations]reply:self.TestMail :^(int returnValue, MSODataException *error) {
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
                else{
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

-(MSOutlookMessage*) getSampleMessage : (NSString*) subject  : (NSString*) to  : (NSString*) cc   {
    MSOutlookMessage *message = [[MSOutlookMessage alloc]init];
    //To recipient
    MSOutlookRecipient *toRecipient = [[MSOutlookRecipient alloc] init];
    MSOutlookEmailAddress* email = [[MSOutlookEmailAddress alloc]init];
    [email setAddress:to];
    [toRecipient setEmailAddress:email];
    
    NSMutableArray *toRecipients = [[NSMutableArray alloc]init];
    [toRecipients addObject:toRecipient];
    [message setToRecipients:toRecipients];
    
    //Cc recipient
    if(![cc isEqualToString:@""]){
        MSOutlookRecipient *ccRecipient = [[MSOutlookRecipient alloc] init];
        MSOutlookEmailAddress* emailCc = [[MSOutlookEmailAddress alloc]init];
        [emailCc setAddress:cc];
        [ccRecipient setEmailAddress:emailCc];
        NSMutableArray *ccRecipients = [[NSMutableArray alloc]init];
        [toRecipients addObject:ccRecipient];
        [message setToRecipients:ccRecipients];
    }
    
    //Body & Subject
    [message setSubject:subject];
    MSOutlookItemBody *body = [[MSOutlookItemBody alloc]init];
    [body setContent:@"This is the email body"];
    [message setBody:body];
    
    return message;
}

// ******* Contact Tests **********

-(NSURLSessionDataTask*)TestGetContactFolder:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[[[self.Client getMe] getContactFolders] getById: @"Contacts"] getContacts] read:^(NSArray<MSOutlookContact>*contacts, MSODataException *error) {
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
    MSOutlookContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionDataTask *task = [[[self.Client getMe] getContacts] addContact:newContact withCallback:^(MSOutlookContact *addedContact, MSODataException *e) {
        //Get contacts
        [[[[self.Client getMe] getContacts] read:^(NSArray<MSOutlookContact>* contacts, MSODataException *error) {
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
                [[[[[self.Client getMe] getContacts] getById:addedContact.Id] deleteContact:^(int status, MSODataException * e) {
                    if(e!=nil)
                        NSLog(@"Error: %@", e);
                }] resume];
            
            result(test);
            
        }] resume];
        
    }];
    
    return task;
}


-(NSURLSessionDataTask*)TestCreateContacts:(void (^) (Test*))result{
    MSOutlookContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionDataTask *task = [[[self.Client getMe] getContacts] addContact:newContact withCallback:^(MSOutlookContact *addedContact, MSODataException *error) {
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
            [[[[[self.Client getMe] getContacts] getById:addedContact.Id] deleteContact:^(int status, MSODataException * error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }] resume];
        
        result(test);
        
    }];
    
    return task;
}


-(NSURLSessionDataTask*)TestDeleteContacts:(void (^) (Test*))result{
    MSOutlookContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionDataTask *task = [[[self.Client getMe] getContacts] addContact:newContact withCallback:^(MSOutlookContact *addedContact, MSODataException *e) {
        //Delete
        [[[[[self.Client getMe] getContacts] getById:addedContact.Id] deleteContact:^(int status, MSODataException * error) {
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
    MSOutlookContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionDataTask *task = [[[self.Client getMe] getContacts] addContact:newContact withCallback:^(MSOutlookContact *addedContact, MSODataException *error) {
        [newContact setDisplayName:@"New Contact Name"];
        
        [[[[[self.Client getMe]getContacts]getById:addedContact.Id] updateContact:newContact withCallback:^(MSOutlookContact *updatedEntity, MSODataException *error) {
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
                [[[[[self.Client getMe] getContacts] getById:updatedEntity.Id] deleteContact:^(int status, MSODataException * error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }] resume];
            
            result(test);
        }] resume];
        
    }];
    
    return task;
}


-(MSOutlookContact *) getContact{
    MSOutlookContact* contact = [[MSOutlookContact alloc]init];
    [contact setDisplayName:@"Test Contact"];
    [contact setGivenName:@"Test Contact Name"];
    
    MSOutlookEmailAddress* email = [[MSOutlookEmailAddress alloc]init];
    [email setAddress:@"test@test.com"];
    NSMutableArray *list = [[NSMutableArray alloc] init];
    [list addObject:email];
    
    [contact setEmailAddresses:list];
    return contact;
}

//******* Calendar Group Tests **********

-(NSURLSessionDataTask*)TestGetCalendarGroups:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[[self.Client getMe] getCalendarGroups] read:^(NSArray<MSOutlookCalendarGroup> *calendarGroups, MSODataException *error) {
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
    
    MSOutlookCalendarGroup *newCalendarGroup = [[MSOutlookCalendarGroup alloc] init];
    [newCalendarGroup setName:calendarGroupName];
    
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendarGroups] addCalendarGroup:newCalendarGroup withCallback:^(MSOutlookCalendarGroup *addedCalendarGroup, MSODataException *e) {
        
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
        [[[[[self.Client getMe]getCalendarGroups]getById:addedCalendarGroup.Id]deleteCalendarGroup:^(int status, MSODataException *error) {
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
    
    MSOutlookCalendarGroup *newCalendarGroup = [[MSOutlookCalendarGroup alloc] init];
    [newCalendarGroup setName:calendarGroupName];
    //Create calendar group
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendarGroups] addCalendarGroup :newCalendarGroup withCallback:^(MSOutlookCalendarGroup *addedCalendarGroup, MSODataException *e) {
        //Get by id
        [[[[[self.Client getMe]getCalendarGroups]getById:addedCalendarGroup.Id]read:^(MSOutlookCalendarGroup *calendarGroup, MSODataException *error) {
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
            [[[[[self.Client getMe]getCalendarGroups]getById:calendarGroup.Id]deleteCalendarGroup:^(int status, MSODataException *error) {
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
    MSOutlookCalendarGroup *newCalendarGroup = [[MSOutlookCalendarGroup alloc] init];
    [newCalendarGroup setName:calendarGroupName];
    
    // Create Calendar
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendarGroups] addCalendarGroup:newCalendarGroup withCallback:^(MSOutlookCalendarGroup *addedCalendarGroup, MSODataException *e) {
        [newCalendarGroup setName:updatedCalendarGroupName];
        //Update Calendar Group
        [[[[[self.Client getMe] getCalendarGroups] getById:addedCalendarGroup.Id] updateCalendarGroup:newCalendarGroup withCallback:^(MSOutlookCalendarGroup *updatedCalendarGroup, MSODataException *error) {
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
            [[[[[self.Client getMe]getCalendarGroups]getById:updatedCalendarGroup.Id]deleteCalendarGroup:^(int status, MSODataException *error) {
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
    
    MSOutlookCalendarGroup *newCalendarGroup = [[MSOutlookCalendarGroup alloc] init];
    [newCalendarGroup setName:calendarGroupName];
    //Create Calendar
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendarGroups] addCalendarGroup:newCalendarGroup withCallback:^(MSOutlookCalendarGroup *addedCalendarGroup, MSODataException *e) {
        //Delete Calendar
        [[[[[self.Client getMe]getCalendarGroups]getById:addedCalendarGroup.Id]deleteCalendarGroup:^(int status, MSODataException *error) {
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
    
    NSURLSessionDataTask *task = [[[self.Client getMe] getCalendars] read:^(NSArray<MSOutlookCalendar> *calendars, MSODataException *error) {
        
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
    
    NSURLSessionDataTask *task = [[[self.Client getMe] getCalendar] read:^(MSOutlookCalendar *calendar, MSODataException *error) {
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
    
    MSOutlookCalendar *newCalendar = [[MSOutlookCalendar alloc] init];
    [newCalendar setName:calendarName];
    
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendars] addCalendar :newCalendar withCallback:^(MSOutlookCalendar *addedCalendar, MSODataException *e) {
        
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
        [[[[[self.Client getMe]getCalendars]getById:addedCalendar.Id]deleteCalendar:^(int status, MSODataException *error) {
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
    
    MSOutlookCalendar *newCalendar = [[MSOutlookCalendar alloc] init];
    [newCalendar setName:calendarName];
    //Create calendar
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendars] addCalendar:newCalendar withCallback:^(MSOutlookCalendar *addedCalendar, MSODataException *e) {
        //Get by id
        [[[[[self.Client getMe]getCalendars]getById:addedCalendar.Id] read:^(MSOutlookCalendar *calendar, MSODataException *error) {
            
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
            [[[[[self.Client getMe]getCalendars]getById:calendar.Id]deleteCalendar:^(int status, MSODataException *error) {
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
    MSOutlookCalendar *newCalendar = [[MSOutlookCalendar alloc] init];
    [newCalendar setName:calendarName];
    
    // Create Calendar
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendars] addCalendar:newCalendar withCallback:^(MSOutlookCalendar *addedCalendar, MSODataException *e) {
        [newCalendar setName:updatedCalendarName];
        //Update Calendar
        [[[[[self.Client getMe] getCalendars] getById:addedCalendar.Id] updateCalendar:newCalendar withCallback:^(MSOutlookCalendar *updatedCalendar, MSODataException *error) {
            
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
            [[[[[self.Client getMe]getCalendars]getById:updatedCalendar.Id]deleteCalendar:^(int status, MSODataException *error) {
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
    
    MSOutlookCalendar *newCalendar = [[MSOutlookCalendar alloc] init];
    [newCalendar setName:calendarName];
    //Create Calendar
    NSURLSessionDataTask* task =[[[self.Client getMe] getCalendars] addCalendar:newCalendar withCallback:^(MSOutlookCalendar *addedCalendar, MSODataException *e) {
        
        //Delete Calendar
        [[[[[self.Client getMe]getCalendars]getById:addedCalendar.Id]deleteCalendar:^(int status, MSODataException *error) {
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
/*
-(NSURLSessionDataTask*)TestGetCalendarView:(void (^) (Test*))result{
    MSOutlookEvent *newEvent = [self getSampleEvent];
    NSURLSessionDataTask* task = [[[self.Client getMe] getEvents] addEvent:newEvent withCallback:^(MSOutlookEvent *addedEvent, MSODataException *e) {

        [[[[[[self.Client getMe] getCalendarView] addCustomParameters:@"startdatetime" :addedEvent.Start ] addCustomParameters:@"enddatetime" :addedEvent.End ] read:^(NSArray<MSOutlookEvent> *events, MSODataException *error) {
            
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
*/
// ****** Event Tests *****

-(NSURLSessionDataTask*)TestGetEvents:(void (^) (Test*))result{
    MSOutlookEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionDataTask *task = [[[self.Client getMe] getEvents] addEvent:event withCallback:^(MSOutlookEvent *addedEvent, MSODataException *e) {
        //Get Events
        [[[[self.Client getMe]getEvents]read:^(NSArray<MSOutlookEvent> *events, MSODataException *error) {
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
            [[[[[self.Client getMe]getEvents]getById:addedEvent.Id]deleteEvent:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        }] resume];
        
        
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCreateEvents:(void (^) (Test*))result{
    MSOutlookEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionDataTask *task = [[[self.Client getMe] getEvents] addEvent:event withCallback:^(MSOutlookEvent *addedEvent, MSODataException *e) {
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
        [[[[[self.Client getMe]getEvents]getById:addedEvent.Id]deleteEvent:^(int status, MSODataException *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }]resume];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestUpdateEvents:(void (^) (Test*))result{
    MSOutlookEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionDataTask *task = [[[self.Client getMe] getEvents] addEvent:event withCallback:^(MSOutlookEvent *addedEvent, MSODataException *e) {
        NSString *updatedSubject = [@"Updated" stringByAppendingString:event.Subject];
        [event setSubject:updatedSubject];
        // Update Event
        [[[[[self.Client getMe] getEvents] getById:addedEvent.Id]updateEvent:event withCallback:^(MSOutlookEvent *updatedEvent, MSODataException *error) {
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
            [[[[[self.Client getMe]getEvents]getById:addedEvent.Id]deleteEvent:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        } ]resume];
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestDeleteEvents:(void (^) (Test*))result{
    MSOutlookEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionDataTask *task = [[[self.Client getMe] getEvents] addEvent:event withCallback:^(MSOutlookEvent *addedEvent, MSODataException *e) {
        //Delete event
        [[[[[self.Client getMe]getEvents]getById:addedEvent.Id]deleteEvent:^(int status, MSODataException *error) {
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

-(NSURLSessionDataTask*)TestCreateMessageWithAttachment:(void (^) (Test*))result{
    MSOutlookMessage *newMessage = [self getSampleMessage:@"Test Attachment" : self.TestMail : @""];
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage, MSODataException *error) {
        
        if(addedMessage!= nil && [addedMessage.Subject isEqualToString:newMessage.Subject]){
            
            MSOutlookFileAttachment* attachment = [[MSOutlookFileAttachment alloc] init];
            
            attachment.ContentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
            attachment.Name = @"TestAttachments.txt";
            
            [[[[[[self.Client getMe] getMessages] getById:addedMessage.Id] getAttachments] addAttachment:attachment withCallback:^(MSOutlookAttachment *a, MSODataException *e) {
                
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

-(NSURLSessionDataTask*)TestGetAttachment:(void (^) (Test*))result{
    MSOutlookMessage *newMessage = [self getSampleMessage:@"Test Attachment" : self.TestMail : @""];
    
    NSURLSessionDataTask* task = [[[self.Client getMe] getMessages] addMessage:newMessage withCallback:^(MSOutlookMessage *addedMessage, MSODataException *error) {
        
        if(addedMessage!= nil && [addedMessage.Subject isEqualToString:newMessage.Subject]){
            
            MSOutlookFileAttachment* attachment = [[MSOutlookFileAttachment alloc] init];
            
            attachment.ContentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
            attachment.Name = @"TestAttachments.txt";
            
            [[[[[[self.Client getMe] getMessages] getById:addedMessage.Id] getAttachments] addAttachment:attachment withCallback:^(MSOutlookAttachment *a, MSODataException *e) {
                
                [[[[[[[[self.Client getMe] getMessages] getById:addedMessage.Id] getAttachments] getById:a.Id] asFileAttachment] read:^(MSOutlookFileAttachment *fileAttachment, MSODataException *error) {
                    
                    BOOL passed = false;
                    
                    Test *test = [Test alloc];
                    
                    test.ExecutionMessages = [NSMutableArray array];
                    
                    NSString* message =  @"";
                    
                    // [[NSString alloc] initWithData:content encoding:NSUTF8StringEncoding];
                    
                    NSString* attachmentContent = [[NSString alloc] initWithData:fileAttachment.ContentBytes encoding:NSUTF8StringEncoding];
                    
                    if(error == nil && a != nil && [a.Name isEqualToString: attachment.Name]
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

-(MSOutlookEvent*) getSampleEvent{
    
    MSOutlookEvent *event= [[MSOutlookEvent alloc]init];
    [event setSubject:@"Today's appointment"];
    [event setStart:[NSDate date]];
    [event setEnd:[[NSDate date] dateByAddingTimeInterval: 3600]];
    MSOutlookImportance importance = High;
    [event setImportance: importance];
    
    //Event Body
    MSOutlookItemBody *itemBody = [[MSOutlookItemBody alloc] init];
    [itemBody setContent:@"This is the appointment info"];
    MSOutlookBodyType bt = Text;
    [itemBody setContentType: bt];
    [event setBody:itemBody];
    
    // Attendees
    MSOutlookAttendee *attendee1 = [[MSOutlookAttendee alloc]init];
    MSOutlookEmailAddress *email = [[MSOutlookEmailAddress alloc]init];
    [email setAddress: self.TestMail];
    [attendee1 setEmailAddress:email];
    
    NSMutableArray *attendees = [[NSMutableArray alloc] init];
    [attendees addObject:attendee1];
    [event setAttendees:(NSMutableArray<MSOutlookAttendee>*)attendees];
    
    return event;
}

@end