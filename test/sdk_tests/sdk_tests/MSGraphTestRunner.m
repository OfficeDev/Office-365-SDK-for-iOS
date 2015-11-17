
#import "MSGraphTestRunner.h"

@implementation MSGraphTestRunner

- (id)initWithClient:(MSGraphServiceClient *)client {

    if(self = [super init]) {
        
        self.Client = client;
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString* mail = [userDefaults objectForKey: @"TestMail"];
        self.TestMail = mail == nil ? @"":mail ;
    }
   
    return self;
}

- (void)run:(NSString *)testName completionHandler:(void(^)(id test))result {
    
    if([testName isEqualToString: @"TestGetContacts"]) return [self TestGetContacts:result];
    if([testName isEqualToString: @"TestGetDevices"]) return [self TestGetDevices:result];
    if([testName isEqualToString: @"TestGetGroups"]) return [self TestGetGroups:result];
    if([testName isEqualToString: @"TestGetDirectoryRoles"]) return [self TestGetDirectoryRoles:result];
    if([testName isEqualToString: @"TestGetDirectoryRoleTemplates"]) return [self TestGetDirectoryRoleTemplates:result];
    if([testName isEqualToString: @"TestGetUsers"]) return [self TestGetUsers:result];
    if([testName isEqualToString: @"TestGetSubscribedSkus"]) return [self TestGetSubscribedSkus:result];
    
    if([testName isEqualToString: @"TestGetOwnedDevices"]) return [self TestGetOwnedDevices:result];
    if([testName isEqualToString: @"TestGetRegisteredDevices"]) return [self TestGetRegisteredDevices:result];
    if([testName isEqualToString: @"TestGetMemberOf"]) return [self TestGetMemberOf:result];
    if([testName isEqualToString: @"TestGetCreatedObjects"]) return [self TestGetCreatedObjects:result];
    if([testName isEqualToString: @"TestGetOwnedObjects"]) return [self TestGetOwnedObjects:result];
    if([testName isEqualToString: @"TestGetOwnedObjectsById"]) return [self TestGetOwnedObjectsById:result];
    
    if([testName isEqualToString: @"TestGetMessages"]) return [self TestGetMessages:result];
    if([testName isEqualToString: @"TestGetMessagesById"]) return [self TestGetMessagesById:result];
    if([testName isEqualToString: @"TestSendMessage"]) return [self TestSendMessage:result];
    if([testName isEqualToString:@"TestGetMessagesOverload"])return [self testGetMessageOverload:result];
    if([testName isEqualToString:@"TestCreateMessages"])return [self testCreateMessages:result];
    if([testName isEqualToString:@"TestCreateHtmlMessages"])return [self testCreateAndSendHtmlMessages:result];
    if([testName isEqualToString:@"TestCreateMessageWithAttachment"])return [self testCreateMessageWithAttachment:result];
    if([testName isEqualToString:@"TestGetAttachment"])return [self testGetAttachment:result];
    if([testName isEqualToString:@"TestUpdateMessages"])return [self testUpdateMessages:result];
    if([testName isEqualToString:@"TestDeleteMessages"])return [self testDeleteMessages:result];
    if([testName isEqualToString:@"TestMoveMessages"])return [self testMoveMessages:result];
    if([testName isEqualToString:@"TestCopyMessages"])return [self testCopyMessages:result];
    if([testName isEqualToString:@"TestSendWithMessageOperations"])return [self testSendWithMessageOperations:result];
    if([testName isEqualToString:@"TestSendHtmlMessages"])return [self testSendHtmlMessages:result];
    if([testName isEqualToString:@"TestReplyMessages"])return [self testReplyMessages:result];
    if([testName isEqualToString:@"TestReplyAllMessages"])return [self testReplyAllMessages:result];
    if([testName isEqualToString:@"TestForwardMessages"])return [self testForwardMessages:result];
    if([testName isEqualToString:@"TestReplyHtmlMessages"])return [self testReplyHtmlMessages:result];
    
    if([testName isEqualToString: @"TestGetCalendars"]) return [self TestGetCalendars:result];
    if([testName isEqualToString: @"TestGetCalendarById"]) return [self TestGetCalendarById:result];
    if([testName isEqualToString: @"TestGetDefaultCalendar"]) return [self TestGetDefaultCalendar:result];
    if([testName isEqualToString: @"TestGetCalendarGroups"]) return [self TestGetCalendars:result];
    if([testName isEqualToString: @"TestGetCalendarGroupById"]) return [self TestGetCalendarById:result];
    if([testName isEqualToString: @"TestGetEvents"]) return [self TestGetEvents:result];
    if([testName isEqualToString: @"TestCreateEvents"])return [self testCreateEvents:result];
    if([testName isEqualToString: @"TestUpdateEvents"])return [self testUpdateEvents:result];
    if([testName isEqualToString: @"TestDeleteEvents"])return [self testDeleteEvents:result];
    if([testName isEqualToString: @"TestGetEventsById"]) return [self TestGetEventsById:result];
    if([testName isEqualToString: @"TestCreateEvents"]) return [self TestCreateEvents:result];
    if([testName isEqualToString: @"TestUpdateEvents"]) return [self TestUpdateEvents:result];
    if([testName isEqualToString: @"TestDeleteEvents"]) return [self TestDeleteEvents:result];
    if([testName isEqualToString: @"TestGetCalendarView"]) return [self TestGetCalendarView:result];
    if([testName isEqualToString: @"TestGetUserPhoto"]) return [self TestGetUserPhoto:result];
    if([testName isEqualToString: @"TestGetUserDrive"]) return [self TestGetUserDrive:result];
    if([testName isEqualToString: @"TestGetUserFiles"]) return [self TestGetUserFiles:result];
    if([testName isEqualToString: @"TestGetUserFilesById"]) return [self TestGetUserFilesById:result];
    if([testName isEqualToString: @"TestCreateFileWithContent"]) return [self TestCreateFileWithContent:result];
    
    if([testName isEqualToString:@"TestGetFolders"])return [self testGetFolders:result];
    if([testName isEqualToString:@"TestGetmailFoldersById"])return [self testGetmailFoldersById:result];
    if([testName isEqualToString:@"TestGetmailFoldersByIdOverload"])return [self testGetmailFoldersByIdOverload:result];
    if([testName isEqualToString:@"TestCreateFolder"])return [self testCreateFolder:result];
    if([testName isEqualToString:@"TestDeleteFolder"])return [self testDeleteFolder:result];
    if([testName isEqualToString:@"TestMoveFolder"])return [self testMoveFolder:result];
    if([testName isEqualToString:@"TestCopyFolder"])return [self testCopyFolder:result];
    if([testName isEqualToString:@"TestUpdateFolder"])return [self testUpdateFolder:result];

}

- (NSMutableArray *)getTests {
    
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetContacts" displayName:@"Get contacts"]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetDevices" displayName:@"Get devices"]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetGroups" displayName:@"Get groups"]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetDirectoryRoles" displayName:@"Get directory roles" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetDirectoryRoleTemplates" displayName:@"Get directory role templates" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUsers" displayName:@"Get users" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetSubscribedSkus" displayName:@"Get suscribed skus" ]];
    
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetOwnedDevices" displayName:@"Get user's owned devices" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetRegisteredDevices" displayName:@"Get user's registered devices" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetMemberOf" displayName:@"Get user's member of" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCreatedObjects" displayName:@"Get user's created objects" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetOwnedObjects" displayName:@"Get user's owned objects" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetOwnedObjectsById" displayName:@"Get user's owned objects by Id" ]];
    
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetMessages" displayName:@"Get user's messages" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetMessagesById" displayName:@"Get user's messages by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSendMessage" displayName:@"Send message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetMessagesOverload" displayName:@"Get Message (overload)" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateMessages" displayName:@"Create message in drafts" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateHtmlMessages" displayName:@"Create and Send Html message in drafts" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestUpdateMessages" displayName:@"Update message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteMessages" displayName:@"Delete message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestMoveMessages" displayName:@"Move message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCopyMessages" displayName:@"Copy message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSendWithMessageOperations" displayName:@"Send with message operations" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSendHtmlMessages" displayName:@"Send Html message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestReplyMessages" displayName:@"Reply message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestReplyAllMessages" displayName:@"ReplyAll message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestForwardMessages" displayName:@"Forward message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateMessageWithAttachment" displayName:@"Create Message With Attachment" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetAttachment" displayName:@"Get Attachment" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestReplyHtmlMessages" displayName:@"Reply Html message" ]];
    
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendars" displayName:@"Get user's calendars" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarById" displayName:@"Get user's calendars by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetDefaultCalendar" displayName:@"Get user's default calendar" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarGroups" displayName:@"Get user's calendar groups" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarById" displayName:@"Get user's calendar group by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetEvents" displayName:@"Get user's events" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetEventsById" displayName:@"Get user's event by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateEvents" displayName:@"Create events" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteEvents" displayName:@"Update events" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteEvents" displayName:@"Delete events" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarView" displayName:@"Get user's calendar view" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUserPhoto" displayName:@"Get user's photo" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUserDrive" displayName:@"Get user's drive" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUserFiles" displayName:@"Get user's files" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUserFilesById" displayName:@"Get user's files by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateFileWithContent" displayName:@"Create file with content" ]];
    
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetFolders" displayName:@"Get Folders" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetmailFoldersById" displayName:@"Get Folders by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetmailFoldersByIdOverload" displayName:@"Get Folders by Id (overload)" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateFolder" displayName:@"Create Folder" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteFolder" displayName:@"Delete Folders" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestMoveFolder" displayName:@"Move Folders" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCopyFolder" displayName:@"Copy Folders" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestUpdateFolder" displayName:@"Update Folders" ]];
    
    return array;
}


-(void)TestGetContacts:(void (^) (Test*))result{

    return [self.Client.me.contacts readWithCallback:^(NSArray *contacts, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && contacts != nil)
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


-(void)TestGetDevices:(void (^) (Test *))result{
    
    return [self.Client.devices readWithCallback:^(NSArray *devices, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && devices != nil)
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

- (void)TestGetGroups:(void (^) (Test *))result {
    
    return [self.Client.groups readWithCallback:^(NSArray *groups, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && groups != nil)
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

-(void)TestGetDirectoryRoles:(void (^) (Test*))result{
    
    return [self.Client.directoryRoles readWithCallback:^(NSArray *directoryRoles, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && directoryRoles != nil)
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

-(void)TestGetDirectoryRoleTemplates:(void (^) (Test*))result{
    
    return [self.Client.directoryRoleTemplates readWithCallback:^(NSArray *directoryRoleTemplates,
                                                                  MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && directoryRoleTemplates != nil)
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


- (void)TestGetUsers:(void (^) (Test *))result {
    
    return [[self.Client.users top:1] readWithCallback:^(NSArray *users, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if(error == nil && users != nil)
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

-(void)TestGetSubscribedSkus:(void (^) (Test*))result{
    
    return [self.Client.subscribedSkus readWithCallback:^(NSArray *subscribedSkus, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && subscribedSkus != nil)
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

-(void)TestGetOwnedDevices:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].ownedDevices readWithCallback:^(NSArray *directoryObjects, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && directoryObjects != nil)
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

-(void)TestGetRegisteredDevices:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].registeredDevices readWithCallback:^(NSArray *directoryObjects, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if (error == nil && directoryObjects != nil) {
            passed = true;
            message = @"Ok - ";
        }
        else {
            
            message = @"Not - ";
            
            if(error!= nil)
                message = [message stringByAppendingString: [error localizedDescription]];
        }
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        result(test);
    }];
}

-(void)TestGetMemberOf:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].memberOf
                      readWithCallback:^(NSArray *directoryObjects, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && directoryObjects != nil)
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

-(void)TestGetCreatedObjects:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].createdObjects readWithCallback:^(NSArray *directoryObjects, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && directoryObjects != nil)
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

-(void)TestGetOwnedObjects:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].ownedObjects readWithCallback:^(NSArray *directoryObjects, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && directoryObjects != nil)
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

-(void)TestGetOwnedObjectsById:(void (^) (Test*))result{

    return [[self.Client.users getById:self.TestMail].ownedObjects readWithCallback:^(NSArray *directoryObjects, MSOrcError *error) {
        
        if (error != nil) {
            
            result([self handleError:error]);
            
            return;
        }
        
        NSString *ownedObjectId = directoryObjects == nil ? @"" : [[directoryObjects objectAtIndex:0] _id];
        
        [[[self.Client.users getById:self.TestMail] ownedObjectsById:ownedObjectId] readWithCallback:^(MSGraphServiceDirectoryObject *directoryObject, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(error == nil && directoryObject != nil)
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
    }];
}

-(void)TestGetMessages:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].messages readWithCallback:^(NSArray *messages, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && messages != nil)
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

-(void)TestGetMessagesById:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].messages readWithCallback:^(NSArray *messages, MSOrcError *error) {
        
        if (error != nil) {
            
            result([self handleError:error]);
            
            return;
        }
        
        NSString *messageId = messages == nil ? @"" : [[messages objectAtIndex:0] _id];
        
        [[[self.Client.users getById:self.TestMail] messagesById:messageId] readWithCallback:^(MSGraphServiceMessage *messageItem, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(error == nil && messageItem != nil)
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
    }];
}

-(void)TestSendMessage:(void (^) (Test*))result{
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.TestMail cc: @""];
    
    //Send Mail
    return [[self.Client.users getById:self.TestMail].operations sendMailWithMessage:newMessage saveToSentItems:true callback:^(int returnValue, MSOrcError *error) {
        
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

- (void)testGetMessageOverload:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.TestMail cc:@""];
    newMessage.body = [[MSGraphServiceItemBody alloc] init];
    newMessage.body.contentType = MSGraphServiceBodyTypeText;
    
    return [weakSelf.Client.me.messages add:newMessage callback:^(MSGraphServiceMessage *addedMessage, MSOrcError *error) {
        
        [[weakSelf.Client.me messagesById:addedMessage._id] readWithCallback:^(MSGraphServiceMessage *searchedMessage, MSOrcError *error) {
            
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
                [[weakSelf.Client.me.messages getById:addedMessage._id] delete:^(int status, MSOrcError *error) {
                    
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            
            result(test);
            
        }];
    }];
}

- (void)testCreateMessages:(void(^)(Test *))result  {
    __weak typeof(self) weakSelf = self;
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.TestMail cc:@""];
    newMessage.body = [[MSGraphServiceItemBody alloc] init];
    newMessage.body.contentType = MSGraphServiceBodyTypeText;
    
    return [weakSelf.Client.me.messages add:newMessage callback:^(MSGraphServiceMessage *addedMessage, MSOrcError *error) {
        
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
            [[weakSelf.Client.me.messages getById:addedMessage._id] delete:^(int status, MSOrcError *error) {
                
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
        
        result(test);
    }];
}

- (void)testCreateAndSendHtmlMessages:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"My Subject Html" to:self.TestMail cc:@""];
    newMessage.body.contentType = MSGraphServiceBodyTypeText;
    newMessage.body.content = @"<div>Html Test</div>";
    
    return [weakSelf.Client.me.operations sendMailWithMessage:newMessage saveToSentItems:true callback:^(int returnValue, MSOrcError *error) {
        
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

- (void)testCreateMessageWithAttachment:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"Test Attachment" to:self.TestMail cc:@""];
    
    return[weakSelf.Client.me.messages add:newMessage callback:^(MSGraphServiceMessage *addedMessage, MSOrcError *error) {
        
        if(addedMessage!= nil && [addedMessage.subject isEqualToString:newMessage.subject]){
            
            MSGraphServiceFileAttachment* attachment = [[MSGraphServiceFileAttachment alloc] init];
            
            attachment.contentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
            attachment.name = @"TestAttachments.txt";
            
            [[weakSelf.Client.me.messages getById:addedMessage._id].attachments add:attachment callback:^(MSGraphServiceAttachment *a, MSOrcError *e) {
                
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
    __weak typeof(self) weakSelf = self;
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"Test Attachment" to:self.TestMail cc:@""];
    
    return[weakSelf.Client.me.messages add:newMessage callback:^(MSGraphServiceMessage *addedMessage, MSOrcError *error) {
        
        if(addedMessage!= nil && [addedMessage.subject isEqualToString:newMessage.subject]){
            
            MSGraphServiceFileAttachment* attachment = [[MSGraphServiceFileAttachment alloc] init];
            
            attachment.contentBytes = [@"Test Message Attachments" dataUsingEncoding: NSUTF8StringEncoding];
            attachment.name = @"TestAttachments.txt";
            
            [[weakSelf.Client.me.messages getById:addedMessage._id].attachments add:attachment callback:^(MSGraphServiceAttachment *a, MSOrcError *e) {
                
                [[[[weakSelf.Client.me.messages getById:addedMessage._id].attachments getById:a._id] asFileAttachment] readWithCallback:^(MSGraphServiceFileAttachment *fileAttachment, MSOrcError *error) {
                    
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

- (void)testUpdateMessages:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.TestMail cc:@""];
    
    //Create message
    return [weakSelf.Client.me.messages add:newMessage callback:^(MSGraphServiceMessage *addedMessage, MSOrcError *error) {
        
        NSString *updatedSubject = @"My Updated Subject";
        addedMessage.Subject = updatedSubject;
        
        //Update message
        [[weakSelf.Client.me.messages getById:addedMessage._id] update:newMessage callback:^(MSGraphServiceMessage *updatedMessage, MSOrcError *error) {
            
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
                [[weakSelf.Client.me.messages getById:updatedMessage._id] delete:^(int status, MSOrcError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            }
            
            result(test);
        }];
    }];
}

- (void)testDeleteMessages:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.TestMail cc:@""];
    
    return [weakSelf.Client.me.messages add:newMessage callback:^(MSGraphServiceMessage *addedMessage, MSOrcError *error) {
        
        [[weakSelf.Client.me.messages getById:addedMessage._id] delete:^(int status, MSOrcError *error) {
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
    __weak typeof(self) weakSelf = self;
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.TestMail cc:@""];
    
    //Create message
    return [weakSelf.Client.me.messages add:newMessage callback:^(MSGraphServiceMessage *addedMessage, MSOrcError *error) {
        
        //Move message
        [[weakSelf.Client.me.messages getById:addedMessage._id].operations moveWithDestinationId:@"Inbox" callback:^(MSGraphServiceMessage *movedMessage, MSOrcError *error) {
            
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
                [[weakSelf.Client.me.messages getById:movedMessage._id] delete:^(int status, MSOrcError *error) {
                    
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            }
            
            result(test);
        }];
    }];
}

- (void)testCopyMessages:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.TestMail cc:@""];
    
    //Create message
    return [weakSelf.Client.me.messages add:newMessage callback:^(MSGraphServiceMessage *addedMessage, MSOrcError *error) {
        
        //Move message
        [[weakSelf.Client.me.messages getById:addedMessage._id].operations copyWithDestinationId:@"Inbox" callback:^(MSGraphServiceMessage *copiedMessage, MSOrcError *error) {
            
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
                [[weakSelf.Client.me.messages getById:copiedMessage._id] delete:^(int status, MSOrcError *error) {
                    
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
                
                [[weakSelf.Client.me.messages getById:addedMessage._id] delete:^(int status, MSOrcError *error) {
                    
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            }
            
            result(test);
        }];
    }];
}

- (void)testSendMessages:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.TestMail cc:@""];
    
    //Send Mail
    return[weakSelf.Client.me.operations sendMailWithMessage:newMessage saveToSentItems:true callback:^(int returnValue, MSOrcError *error) {
        
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
    __weak typeof(self) weakSelf = self;
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.TestMail cc:@""];
    
    //Send Mail
    return[weakSelf.Client.me.messages add:newMessage callback:^(MSGraphServiceMessage *message, MSOrcError *e) {
        
        [[weakSelf.Client.me.messages getById:message._id].operations sendWithCallback:^(int returnValue, MSOrcError *error) {
            
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
    __weak typeof(self) weakSelf = self;
    MSGraphServiceMessage *newMessage = [self getSampleMessage:@"My Html Subject" to:self.TestMail cc:@""];
    newMessage.body.content = @"<h1>This is an Html body.</h1><a href='#'>With Link!</a>";
    newMessage.body.contentType = MSGraphServiceBodyTypeText;
    
    //Send Mail
    return[weakSelf.Client.me.operations sendMailWithMessage:newMessage saveToSentItems:true callback:^(int returnValue, MSOrcError *error) {
        
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
    __weak typeof(self) weakSelf = self;
    return [[weakSelf.Client.me.messages top:1] readWithCallback:^(NSArray *messages, MSOrcError *error) {
        
        if ([messages count] == 0) {
            
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            test.passed = false;
            [test.executionMessages addObject:@"Not - No available mails to reply"];
            result(test);
        }
        else {
            
            MSGraphServiceMessage *currentMessage = [messages objectAtIndex:0];
            
            [[weakSelf.Client.me.messages getById:currentMessage._id].operations createReplyWithCallback:^(MSGraphServiceMessage *replyMessage, MSOrcError *error) {
                
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
                    [[weakSelf.Client.me.messages getById:replyMessage._id] delete:^(int status, MSOrcError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                result(test);
            }];
        }
    }];
}

- (void)testReplyAllMessages:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    return [[weakSelf.Client.me.messages top:1] readWithCallback:^(NSArray *messages, MSOrcError *error) {
        
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            test.passed = false;
            [test.executionMessages addObject:@"Not - No available mails to reply all"];
            result(test);
        }
        else{
            MSGraphServiceMessage *currentMessage = [messages objectAtIndex:0];
            
            [[weakSelf.Client.me.messages getById:currentMessage._id].operations createReplyAllWithCallback:^(MSGraphServiceMessage *replyAllMessage, MSOrcError *error) {
                
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
                    [[weakSelf.Client.me.messages getById:replyAllMessage._id] delete:^(int status, MSOrcError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                result(test);
            }];
        }
    }];
}

- (void)testForwardMessages:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    return[[weakSelf.Client.me.messages top:1] readWithCallback:^(NSArray *messages, MSOrcError *error) {
        
        if([messages count] == 0){
            Test *test = [Test alloc];
            test.executionMessages = [NSMutableArray array];
            test.passed = false;
            [test.executionMessages addObject:@"Not - No available mails to reply all"];
            result(test);
        }
        else {
            
            MSGraphServiceMessage *currentMessage = [messages objectAtIndex:0];
            
            [[weakSelf.Client.me.messages getById:currentMessage._id].operations createForwardWithCallback:^(MSGraphServiceMessage *fwMessage, MSOrcError *error) {
                
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
                    [[weakSelf.Client.me.messages getById:fwMessage._id] delete:^(int status, MSOrcError *error) {
                        if(error!= nil)
                            NSLog(@"Error: %@", error);
                    }];
                
                result(test);
            }];
        }
    }];
}

- (void)testReplyHtmlMessages:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *messageSubject =[@"My HTML Email" stringByAppendingString:uuid];
    MSGraphServiceMessage *message = [self getSampleMessage:messageSubject to:self.TestMail cc:@"" ];
    message.body.content = @"<h1>This is an Html body.</h1>";
    message.body.contentType = MSGraphServiceBodyTypeText;
    message.body.contentType = MSGraphServiceBodyTypeText;
    
    //Send mail with HTML body
    return[weakSelf.Client.me.operations sendMailWithMessage:message saveToSentItems:true callback:^(int returnValue, MSOrcError *error) {
        
        // Get sent mail
        [[weakSelf.Client.me.mailFolders filter:@"DisplayName eq 'Sent Items'"] readWithCallback:^(NSArray *mailFolders, MSOrcError *error) {
            
            MSGraphServiceMailFolder *sentItemsFolder = [mailFolders objectAtIndex:0];
            
            NSString *filter = [[@"Subject eq '" stringByAppendingString:messageSubject] stringByAppendingString:@"'"];
            
            [[[weakSelf.Client.me.mailFolders getById:sentItemsFolder._id ].messages filter:filter] readWithCallback:^(NSArray *messages, MSOrcError *error) {
                
                if(error == nil && messages.count == 1 && [[[messages objectAtIndex:0] body] contentType] == MSGraphServiceBodyTypeText){
                    MSGraphServiceMessage *currentMessage = [messages objectAtIndex:0];
                    
                    //Reply message
                    [[weakSelf.Client.me.messages getById:currentMessage._id].operations replyWithComment:self.TestMail callback:^(int returnValue, MSOrcError *error) {
                        
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

-(void)TestGetCalendars:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].calendars readWithCallback:^(NSArray *calendars, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && calendars != nil)
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

- (void)TestGetCalendarById:(void (^) (Test *))result {
    
    return [[self.Client.users getById:self.TestMail].calendars readWithCallback:^(NSArray *calendars, MSOrcError *error) {
        
        if (error != nil) {
            
            result([self handleError:error]);
            
            return;
        }
        
        NSString *calendarId = calendars == nil ? @"" : [[calendars objectAtIndex:0] _id];
        
        [[[self.Client.users getById:self.TestMail].calendars getById:calendarId] readWithCallback:^(MSGraphServiceCalendar *calendarItem, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(error == nil && calendarItem != nil)
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
    }];
}

- (void)TestGetDefaultCalendar:(void (^) (Test *))result {
    
    return [[self.Client.users getById:self.TestMail].calendar readWithCallback:^(MSGraphServiceCalendar *calendar, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && calendar != nil)
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

-(void)TestGetCalendarGroups:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].calendarGroups readWithCallback:^(NSArray *calendarGroups, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && calendarGroups != nil)
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

-(void)TestGetCalendarGroupById:(void (^) (Test*))result{

    return [[self.Client.users getById:self.TestMail].calendarGroups readWithCallback:^(NSArray *calendarGroups, MSOrcError *error) {
        
        if (error != nil) {
            
            result([self handleError:error]);
            
            return;
        }
        
        NSString *calendarGroupId = calendarGroups == nil ? @"" : [[calendarGroups objectAtIndex:0] _id];
        
        [[[self.Client.users getById:self.TestMail].calendarGroups getById:calendarGroupId] readWithCallback:^(MSGraphServiceCalendarGroup *calendarGroup, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(error == nil && calendarGroup != nil)
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
    }];
}

-(void)TestGetEvents:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].events readWithCallback:^(NSArray *events, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && events != nil)
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

- (void)testCreateEvents:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    MSGraphServiceEvent *event = [self getSampleEvent];
    //Create Event
    return [self.Client.me.events add:event callback:^(MSGraphServiceEvent *addedEvent, MSOrcError *e) {
        
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
        [[weakSelf.Client.me.events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }];
        
        result(test);
    }];
}

- (void)testUpdateEvents:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    MSGraphServiceEvent *event = [self getSampleEvent];
    
    //Create Event
    return [weakSelf.Client.me.events add:event callback:^(MSGraphServiceEvent *addedEvent, MSOrcError *e) {
        
        NSString *updatedSubject = [@"Updated" stringByAppendingString:event.subject];
        event.subject = updatedSubject;
        
        // Update Event
        [[weakSelf.Client.me.events getById:addedEvent._id] update:event callback:^(MSGraphServiceEvent *updatedEvent, MSOrcError *error) {
            
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
            [[weakSelf.Client.me.events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
        }];
    }];
}

- (void)testDeleteEvents:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    MSGraphServiceEvent *event = [self getSampleEvent];
    
    //Create Event
    return [weakSelf.Client.me.events add:event callback:^(MSGraphServiceEvent *addedEvent, MSOrcError *e) {
        
        //Delete event
        [[weakSelf.Client.me.events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
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

-(void)TestGetEventsById:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].events readWithCallback:^(NSArray *events, MSOrcError *error) {
        
        if (error != nil) {
            
            result([self handleError:error]);
            
            return;
        }
        
        NSString *eventId = events == nil ? @"" : [[events objectAtIndex:0] _id];
        
        [[[self.Client.users getById:self.TestMail].events getById:eventId] readWithCallback:^(MSGraphServiceEvent *event, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(error == nil && event != nil)
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
    }];
}

-(void)TestCreateEvents:(void (^) (Test*))result{
    MSGraphServiceEvent *event = [self getSampleEvent];
    //Create Event
    
    return [[self.Client.users getById:self.TestMail].events add:event callback:^(MSGraphServiceEvent *addedEvent, MSOrcError *e) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        
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
        
        test.passed = passed;
        [test.executionMessages addObject:message];
        
        //Cleanup
        [[[self.Client.users getById:self.TestMail].events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }];
        
        result(test);
    }];
}

-(void)TestUpdateEvents:(void (^) (Test*))result{

    __weak typeof(self) weakSelf = self;
    
    MSGraphServiceEvent *event = [self getSampleEvent];
    //Create Event
    return [[self.Client.users getById:self.TestMail].events add:event callback:^(MSGraphServiceEvent *addedEvent, MSOrcError *e) {
        
        NSString *updatedSubject = [@"Updated" stringByAppendingString:event.subject];
        event.Subject = updatedSubject;
        // Update Event
        [[[self.Client.users getById:self.TestMail].events getById:addedEvent._id]update:event callback:^(MSGraphServiceEvent *updatedEvent, MSOrcError *error) {
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
            [[[weakSelf.Client.users getById:self.TestMail].events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
                
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
        }];
    }];
}

-(void)TestDeleteEvents:(void (^) (Test*))result{
    __weak typeof(self) weakSelf = self;
    MSGraphServiceEvent *event = [self getSampleEvent];
    //Create Event
    return [[self.Client.users getById:self.TestMail].events add:event callback:^(MSGraphServiceEvent *addedEvent, MSOrcError *e) {
        
        //Delete event
        [[[weakSelf.Client.users getById:self.TestMail].events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
            
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

-(void)TestGetCalendarView:(void (^) (Test*))result{
    MSGraphServiceEvent *newEvent = [self getSampleEvent];
    
    return [[self.Client.users getById:self.TestMail].events add:newEvent callback:^(MSGraphServiceEvent *addedEvent, MSOrcError *e) {
        
        NSDate *startDate = [MSOrcObjectizer dateFromString:newEvent.start.dateTime];
        NSDate *endDate = [MSOrcObjectizer dateFromString:newEvent.end.dateTime];
        
        [[[[self.Client.users getById:self.TestMail].calendarView addCustomParametersWithName:@"startdatetime" value:startDate]
                                                                  addCustomParametersWithName:@"enddatetime" value:endDate ]
                     readWithCallback:^(NSArray *events, MSOrcError *error) {
            
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
            [[[self.Client.users getById:self.TestMail].events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
        }];
    }];
}

-(void)TestGetUserPhoto:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].photo readWithCallback:^(MSGraphServiceProfilePhoto *photo, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && photo != nil)
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

-(void)TestGetUserDrive:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].drive readWithCallback:^(MSGraphServiceDrive *drive, MSOrcError *error) {
        
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

-(void)TestGetUserFiles:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].drive.root.children readWithCallback:^(NSArray *items, MSOrcError *error) {
        
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

-(void)TestGetUserFilesById:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].drive.root.children readWithCallback:^(NSArray *items, MSOrcError *error) {
        
        if (error != nil) {
            
            result([self handleError:error]);
            
            return;
        }
        
        NSString *itemId = items == nil ? @"" : [[items objectAtIndex:0] _id];
        
        [[[self.Client.users getById:self.TestMail].drive.items getById:itemId] readWithCallback:^(MSGraphServiceDriveItem *item, MSOrcError *error) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.executionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(error == nil && item != nil)
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
    }];
}

-(void)TestCreateFileWithContent:(void (^) (Test*))result {
    MSGraphServiceDriveItem *itemToAdd = [self getFileItem];
    NSData *content =[@"Test Message content" dataUsingEncoding: NSUTF8StringEncoding];

    //Create file
    return [[self.Client.users getById:self.TestMail].drive.root.children add:itemToAdd callback:^(MSGraphServiceDriveItem *addedItem, MSOrcError *error) {
        
        //Put content to file
        [[[self.Client.users getById:self.TestMail].drive.root.children getById:addedItem._id].content putContent: content callback:^(NSInteger returnValue, MSOrcError *error) {
            
            //Get file content
            [[[self.Client.users getById:self.TestMail].drive.items getById:addedItem._id].content getStreamedContentWithCallback:^(NSStream *addedContent, MSOrcError *error) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                test.executionMessages = [NSMutableArray array];
                
                NSString* message = @"";
                
                if(error == nil && addedItem != nil && addedContent != nil){
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
                    
                    [[[[self.Client.users getById:self.TestMail].drive.items getById:addedItem._id] addCustomHeaderWithName:@"If-Match" value:@"*"]
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

- (void)testGetFolders:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    return [weakSelf.Client.me.mailFolders readWithCallback:^(NSArray *mailFolders, MSOrcError *error) {
        
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
    __weak typeof(self) weakSelf = self;
    return [[weakSelf.Client.me.mailFolders getById:@"Inbox"] readWithCallback:^(MSGraphServiceMailFolder *folder, MSOrcError *error) {
        
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
    __weak typeof(self) weakSelf = self;
    return [[weakSelf.Client.me mailFoldersById:@"Inbox"] readWithCallback:^(MSGraphServiceMailFolder *folder, MSOrcError *error) {
        
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
    __weak typeof(self) weakSelf = self;
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSGraphServiceMailFolder *newFolder = [[MSGraphServiceMailFolder alloc] init];
    newFolder.displayName = folderName;
    
    return [[weakSelf.Client.me.mailFolders getById:@"Inbox"].childFolders add:newFolder callback:^(MSGraphServiceMailFolder *folder, MSOrcError *e) {
        
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
    __weak typeof(self) weakSelf = self;
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSGraphServiceMailFolder *newFolder = [[MSGraphServiceMailFolder alloc] init];
    newFolder.displayName = folderName;
    
    //Create folder
    return [[weakSelf.Client.me.mailFolders getById:@"Inbox"].childFolders add:newFolder callback:^(MSGraphServiceMailFolder *folder, MSOrcError *e) {
        
        [[weakSelf.Client.me.mailFolders getById:folder._id] delete:^(int status, MSOrcError *error) {
            
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
    __weak typeof(self) weakSelf = self;
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSGraphServiceMailFolder *newFolder = [[MSGraphServiceMailFolder alloc] init];
    newFolder.displayName = folderName;
    
    return [[weakSelf.Client.me.mailFolders getById:@"Inbox"].childFolders add:newFolder callback:^(MSGraphServiceMailFolder *addedFolder, MSOrcError *e) {
        
        [[weakSelf.Client.me.mailFolders getById:addedFolder._id].operations moveWithDestinationId:@"Drafts" callback:^(MSGraphServiceMailFolder *folder, MSOrcError *error) {
            
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
                [[weakSelf.Client.me.mailFolders getById:folder._id] delete:^(int status, MSOrcError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            
            result(test);
            
        }];
    }];
}

- (void)testCopyFolder:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSGraphServiceMailFolder *newFolder = [[MSGraphServiceMailFolder alloc] init];
    newFolder.displayName = folderName;
    
    return [[weakSelf.Client.me.mailFolders getById:@"Inbox"].childFolders add:newFolder callback:^(MSGraphServiceMailFolder *addedFolder, MSOrcError *e) {
        
        [[weakSelf.Client.me.mailFolders getById:addedFolder._id].operations copyWithDestinationId:@"Drafts" callback:^(MSGraphServiceMailFolder *copiedFolder, MSOrcError *error) {
            
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
                [[weakSelf.Client.me.mailFolders getById:copiedFolder._id] delete:^(int status, MSOrcError *error) {
                    if(error!= nil)
                        NSLog(@"Error: %@", error);
                }];
            }
            
            [[weakSelf.Client.me.mailFolders getById:addedFolder._id] delete:^(int status, MSOrcError *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
            
        }];
    }];
    
}

- (void)testUpdateFolder:(void(^)(Test *))result {
    __weak typeof(self) weakSelf = self;
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *folderName = [@"A new folder" stringByAppendingString:uuid];
    
    MSGraphServiceMailFolder *newFolder = [[MSGraphServiceMailFolder alloc] init];
    newFolder.displayName = folderName;
    
    return [[weakSelf.Client.me.mailFolders getById:@"Inbox"].childFolders add:newFolder callback:^(MSGraphServiceMailFolder *addedFolder, MSOrcError *e) {
        
        NSString *updatedFolderName = [@"Updated" stringByAppendingString:folderName];
        newFolder.displayName = updatedFolderName;
        
        [[weakSelf.Client.me.mailFolders getById:addedFolder._id] update:newFolder callback:^(MSGraphServiceMailFolder *updatedFolder, MSOrcError *error) {
            
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


- (MSGraphServiceMessage *)getSampleMessage:(NSString *)subject to:(NSString *)to cc:(NSString *)cc {
    
    MSGraphServiceMessage *message = [[MSGraphServiceMessage alloc]init];
    //To recipient
    MSGraphServiceRecipient *toRecipient = [[MSGraphServiceRecipient alloc] init];
    MSGraphServiceEmailAddress* email = [[ MSGraphServiceEmailAddress alloc]init];
    [email setAddress:to];
    [toRecipient setEmailAddress:email];
    
    NSMutableArray *toRecipients = [[NSMutableArray alloc]init];
    [toRecipients addObject:toRecipient];
    [message setToRecipients:toRecipients];
    
    //Cc recipient
    if(![cc isEqualToString:@""]){
        MSGraphServiceRecipient *ccRecipient = [[ MSGraphServiceRecipient alloc] init];
        MSGraphServiceEmailAddress* emailCc = [[ MSGraphServiceEmailAddress alloc]init];
        [emailCc setAddress:cc];
        [ccRecipient setEmailAddress:emailCc];
        NSMutableArray *ccRecipients = [[NSMutableArray alloc]init];
        [toRecipients addObject:ccRecipient];
        [message setToRecipients:ccRecipients];
    }
    
    //Body & Subject
    [message setSubject:subject];
    MSGraphServiceItemBody *body = [[ MSGraphServiceItemBody alloc]init];
    [body setContent:@"This is the email body"];
    [message setBody:body];
    
    return message;
}

- (MSGraphServiceEvent *)getSampleEvent {
    
    MSGraphServiceEvent *event= [[MSGraphServiceEvent alloc]init];
    event.Subject = @"Today's appointment";
    event.start = [[MSGraphServiceDateTimeTimeZone alloc] init];
    event.start.dateTime = [MSOrcObjectizer stringFromDate:[NSDate date]];
    event.start.timeZone = @"UTC";
    
    event.end = [[MSGraphServiceDateTimeTimeZone alloc] init];
    event.end.dateTime = [MSOrcObjectizer stringFromDate:[[NSDate date] dateByAddingTimeInterval: 3600]];
    event.end.timeZone = @"UTC";

    MSGraphServiceImportance importance = MSGraphServiceImportanceHigh;
    event.Importance = importance;
    
    //Event Body
    MSGraphServiceItemBody *itemBody = [[MSGraphServiceItemBody alloc] init];
    itemBody.Content = @"This is the appointment info";
    
    MSGraphServiceBodyType bt = MSGraphServiceBodyTypeText;
    itemBody.ContentType = bt;
    event.Body = itemBody;
    
    // Attendees
    MSGraphServiceAttendee *attendee1 = [[MSGraphServiceAttendee alloc]init];
    MSGraphServiceEmailAddress *email = [[MSGraphServiceEmailAddress alloc]init];
    
    email.Address = self.TestMail;
    attendee1.EmailAddress = email;
    
    NSMutableArray *attendees = [[NSMutableArray alloc] init];
    [attendees addObject:attendee1];
    
    event.Attendees = (NSMutableArray *)attendees;
    
    return event;
}

- (MSGraphServiceDriveItem *)getFileItem {
    
    NSString *fileName = [[[NSUUID UUID] UUIDString] stringByAppendingString:@".txt"];
    
    MSGraphServiceFile *file = [[MSGraphServiceFile alloc]init];
    
    MSGraphServiceDriveItem *item = [[MSGraphServiceDriveItem alloc] init];
    [item setFile:file];
    [item setName:fileName];
    
    return item;
}

- (Test *)handleError:(MSOrcError *)error {
    
    Test *test = [Test alloc];
    
    test.executionMessages = [NSMutableArray array];
    [test.executionMessages addObject:[error localizedDescription]];
    test.passed = false;
    
    return test;
}

@end
