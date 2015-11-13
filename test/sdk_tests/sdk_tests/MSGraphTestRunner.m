
#import "MSGraphTestRunner.h"

@implementation MSGraphTestRunner

- (id)initWithClient:(MSGraphClient *)client {

    if(self = [super init]) {
        
        self.Client = client;
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString* mail = [userDefaults objectForKey: @"TestMail"];
        self.TestMail = mail == nil ? @"":mail ;
    }
   
    return self;
}

- (void)run:(NSString *)testName completionHandler:(void(^)(id test))result {
    
    if([testName isEqualToString: @"TestGetApplications"]) return [self TestGetApplications:result];
    if([testName isEqualToString: @"TestGetContacts"]) return [self TestGetContacts:result];
    if([testName isEqualToString: @"TestGetDeviceConfiguration"]) return [self TestGetDeviceConfiguration:result];
    if([testName isEqualToString: @"TestGetDevices"]) return [self TestGetDevices:result];
    if([testName isEqualToString: @"TestGetGroups"]) return [self TestGetGroups:result];
    if([testName isEqualToString: @"TestGetDirectoryRoles"]) return [self TestGetDirectoryRoles:result];
    if([testName isEqualToString: @"TestGetDirectoryRoleTemplates"]) return [self TestGetDirectoryRoleTemplates:result];
    if([testName isEqualToString: @"TestGetServicePrincipals"]) return [self TestGetServicePrincipals:result];
    if([testName isEqualToString: @"TestGetTenantDetails"]) return [self TestGetTenantDetails:result];
    if([testName isEqualToString: @"TestGetUsers"]) return [self TestGetUsers:result];
    if([testName isEqualToString: @"TestGetSubscribedSkus"]) return [self TestGetSubscribedSkus:result];
    
    if([testName isEqualToString: @"TestGetUserAppRoleAssignments"]) return [self TestGetUserAppRoleAssignments:result];
    if([testName isEqualToString: @"TestGetOauth2PermissionGrants"]) return [self TestGetOauth2PermissionGrants:result];
    if([testName isEqualToString: @"TestGetOwnedDevices"]) return [self TestGetOwnedDevices:result];
    if([testName isEqualToString: @"TestGetRegisteredDevices"]) return [self TestGetRegisteredDevices:result];
    if([testName isEqualToString: @"TestGetMemberOf"]) return [self TestGetMemberOf:result];
    if([testName isEqualToString: @"TestGetMemberOfById"]) return [self TestGetMemberOfById:result];
    if([testName isEqualToString: @"TestGetCreatedObjects"]) return [self TestGetCreatedObjects:result];
    if([testName isEqualToString: @"TestGetOwnedObjects"]) return [self TestGetOwnedObjects:result];
    if([testName isEqualToString: @"TestGetOwnedObjectsById"]) return [self TestGetOwnedObjectsById:result];
    if([testName isEqualToString: @"TestGetMessages"]) return [self TestGetMessages:result];
    if([testName isEqualToString: @"TestGetMessagesById"]) return [self TestGetMessagesById:result];
    if([testName isEqualToString: @"TestSendMessage"]) return [self TestSendMessage:result];
    if([testName isEqualToString: @"TestGetCalendars"]) return [self TestGetCalendars:result];
    if([testName isEqualToString: @"TestGetCalendarById"]) return [self TestGetCalendarById:result];
    if([testName isEqualToString: @"TestGetDefaultCalendar"]) return [self TestGetDefaultCalendar:result];
    if([testName isEqualToString: @"TestGetCalendarGroups"]) return [self TestGetCalendars:result];
    if([testName isEqualToString: @"TestGetCalendarGroupById"]) return [self TestGetCalendarById:result];
    if([testName isEqualToString: @"TestGetEvents"]) return [self TestGetEvents:result];
    if([testName isEqualToString: @"TestGetEventsById"]) return [self TestGetEventsById:result];
    if([testName isEqualToString: @"TestCreateEvents"]) return [self TestCreateEvents:result];
    if([testName isEqualToString: @"TestUpdateEvents"]) return [self TestUpdateEvents:result];
    if([testName isEqualToString: @"TestDeleteEvents"]) return [self TestDeleteEvents:result];
    if([testName isEqualToString: @"TestGetCalendarView"]) return [self TestGetCalendarView:result];
    if([testName isEqualToString: @"TestGetUserPhoto"]) return [self TestGetUserPhoto:result];
    if([testName isEqualToString: @"TestGetUserPhotos"]) return [self TestGetUserPhotos:result];
    if([testName isEqualToString: @"TestGetUserPhotoById"]) return [self TestGetUserPhotoById:result];
    if([testName isEqualToString: @"TestGetUserDrive"]) return [self TestGetUserDrive:result];
    if([testName isEqualToString: @"TestGetUserFiles"]) return [self TestGetUserFiles:result];
    if([testName isEqualToString: @"TestGetUserFilesById"]) return [self TestGetUserFilesById:result];
    if([testName isEqualToString: @"TestCreateFileWithContent"]) return [self TestCreateFileWithContent:result];
    /*Can create user's files
     Can update user's files
     Can delete user's files
     */
}

- (NSMutableArray *)getTests {
    
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetApplications" displayName:@"Get applications"]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetContacts" displayName:@"Get contacts"]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetDeviceConfiguration" displayName:@"Get device configuration"]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetDevices" displayName:@"Get devices"]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetGroups" displayName:@"Get groups"]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetDirectoryRoles" displayName:@"Get directory roles" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetDirectoryRoleTemplates" displayName:@"Get directory role templates" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetServicePrincipals" displayName:@"Get service principals" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetTenantDetails" displayName:@"Get tenant details" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUsers" displayName:@"Get users" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetSubscribedSkus" displayName:@"Get suscribed skus" ]];
    
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUserAppRoleAssignments" displayName:@"Get user's app role assigments" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetOauth2PermissionGrants" displayName:@"Get user's Oauth2 permission grants" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetOwnedDevices" displayName:@"Get user's owned devices" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetRegisteredDevices" displayName:@"Get user's registered devices" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetMemberOf" displayName:@"Get user's member of" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetMemberOfById" displayName:@"Get user's member of by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCreatedObjects" displayName:@"Get user's created objects" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetOwnedObjects" displayName:@"Get user's owned objects" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetOwnedObjectsById" displayName:@"Get user's owned objects by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetMessages" displayName:@"Get user's messages" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetMessagesById" displayName:@"Get user's messages by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestSendMessage" displayName:@"Send message" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendars" displayName:@"Get user's calendars" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarById" displayName:@"Get user's calendars by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetDefaultCalendar" displayName:@"Get user's default calendar" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarGroups" displayName:@"Get user's calendar groups" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarById" displayName:@"Get user's calendar group by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetEvents" displayName:@"Get user's events" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetEventsById" displayName:@"Get user's event by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateEvents" displayName:@"Create events" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestUpdateEvents" displayName:@"Update events" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestDeleteEvents" displayName:@"Delete events" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetCalendarView" displayName:@"Get user's calendar view" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUserPhoto" displayName:@"Get user's photo" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUserPhotos" displayName:@"Get user's photos" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUserPhotoById" displayName:@"Get user's photo by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUserDrive" displayName:@"Get user's drive" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUserFiles" displayName:@"Get user's files" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestGetUserFilesById" displayName:@"Get user's files by Id" ]];
    [array addObject:[[Test alloc] initWithData:self name:@"TestCreateFileWithContent" displayName:@"Create file with content" ]];
    
    return array;
}

-(void)TestGetApplications:(void (^) (Test*))result{
    
    [self.Client.applications readWithCallback:^(NSArray *applications, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if(error == nil && applications != nil)
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

-(void)TestGetContacts:(void (^) (Test*))result{
    
    return [self.Client.contacts readWithCallback:^(NSArray *contacts, MSOrcError *error) {
        
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

-(void)TestGetDeviceConfiguration:(void (^) (Test*))result{
    
    return [self.Client.deviceConfiguration readWithCallback:^(NSArray *deviceConfigurations, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && deviceConfigurations != nil)
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

-(void)TestGetServicePrincipals:(void (^) (Test*))result{
    
    return [self.Client.servicePrincipals readWithCallback:^(NSArray *servicePrincipals, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && servicePrincipals != nil)
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

- (void)TestGetTenantDetails:(void (^) (Test*))result {
    
    return [self.Client.tenantDetails readWithCallback:^(NSArray *tenantDetails, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        
        if(error == nil && tenantDetails != nil) {
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

-(void)TestGetUserAppRoleAssignments:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].appRoleAssignments
                      readWithCallback:^(NSArray *appRoleAssignments, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
                          
        if(error == nil && appRoleAssignments != nil) {
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

- (void)TestGetOauth2PermissionGrants:(void (^) (Test *))result {
    
    return [[self.Client.users getById:self.TestMail].oauth2PermissionGrants
                      readWithCallback:^(NSArray *oAuth2PermissionGrants, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
                          
        if(error == nil && oAuth2PermissionGrants != nil) {
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

-(void)TestGetMemberOfById:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].memberOf readWithCallback:^(NSArray *directoryObjects, MSOrcError *error) {
        
        if (error != nil) {
            
            result([self handleError:error]);
            
            return;
        }
        
        NSString *memberOfId = directoryObjects == nil ? @"" : [[directoryObjects objectAtIndex:0] objectId];
        
        [[[self.Client.users getById:self.TestMail] memberOfById:memberOfId] readWithCallback:^(MSGraphDirectoryObject *directoryObject, MSOrcError *error) {
            
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
        
        NSString *ownedObjectId = directoryObjects == nil ? @"" : [[directoryObjects objectAtIndex:0] objectId];
        
        [[[self.Client.users getById:self.TestMail] ownedObjectsById:ownedObjectId] readWithCallback:^(MSGraphDirectoryObject *directoryObject, MSOrcError *error) {
            
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
        
        [[[self.Client.users getById:self.TestMail] messagesById:messageId] readWithCallback:^(MSGraphMessage *messageItem, MSOrcError *error) {
            
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
    MSGraphMessage *newMessage = [self getSampleMessage:@"My Subject" to:self.TestMail cc: @""];
    
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
        
        [[[self.Client.users getById:self.TestMail].calendars getById:calendarId] readWithCallback:^(MSGraphCalendar *calendarItem, MSOrcError *error) {
            
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
    
    return [[self.Client.users getById:self.TestMail].calendar readWithCallback:^(MSGraphCalendar *calendar, MSOrcError *error) {
        
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
        
        [[[self.Client.users getById:self.TestMail].calendarGroups getById:calendarGroupId] readWithCallback:^(MSGraphCalendarGroup *calendarGroup, MSOrcError *error) {
            
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

-(void)TestGetEventsById:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].events readWithCallback:^(NSArray *events, MSOrcError *error) {
        
        if (error != nil) {
            
            result([self handleError:error]);
            
            return;
        }
        
        NSString *eventId = events == nil ? @"" : [[events objectAtIndex:0] _id];
        
        [[[self.Client.users getById:self.TestMail].events getById:eventId] readWithCallback:^(MSGraphEvent *event, MSOrcError *error) {
            
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
    MSGraphEvent *event = [self getSampleEvent];
    //Create Event
    
    return [[self.Client.users getById:self.TestMail].events add:event callback:^(MSGraphEvent *addedEvent, MSOrcError *e) {
        
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
    MSGraphEvent *event = [self getSampleEvent];
    //Create Event
    return [[self.Client.users getById:self.TestMail].events add:event callback:^(MSGraphEvent *addedEvent, MSOrcError *e) {
        
        NSString *updatedSubject = [@"Updated" stringByAppendingString:event.subject];
        event.Subject = updatedSubject;
        // Update Event
        [[[self.Client.users getById:self.TestMail].events getById:addedEvent._id]update:event callback:^(MSGraphEvent *updatedEvent, MSOrcError *error) {
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
            [[[self.Client.users getById:self.TestMail].events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
                
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }];
            
            result(test);
        }];
    }];
}

-(void)TestDeleteEvents:(void (^) (Test*))result{
    MSGraphEvent *event = [self getSampleEvent];
    //Create Event
    return [[self.Client.users getById:self.TestMail].events add:event callback:^(MSGraphEvent *addedEvent, MSOrcError *e) {
        
        //Delete event
        [[[self.Client.users getById:self.TestMail].events getById:addedEvent._id] delete:^(int status, MSOrcError *error) {
            
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
    MSGraphEvent *newEvent = [self getSampleEvent];
    
    return [[self.Client.users getById:self.TestMail].events add:newEvent callback:^(MSGraphEvent *addedEvent, MSOrcError *e) {
        
        [[[[self.Client.users getById:self.TestMail].calendarView addCustomParametersWithName:@"startdatetime" value:newEvent.start]
                                                                  addCustomParametersWithName:@"enddatetime" value:newEvent.end ]
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

-(void)TestGetUserPhotos:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].photos readWithCallback:^(NSArray *photos, MSOrcError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.executionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(error == nil && photos != nil)
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

-(void)TestGetUserPhotoById:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].photos readWithCallback:^(NSArray *photos, MSOrcError *error) {
        
        if (error != nil) {
            
            result([self handleError:error]);
            
            return;
        }
        
        NSString *photoId = photos == nil ? @"" : [[photos objectAtIndex:0] _id];
        
        [[[self.Client.users getById:self.TestMail].photos getById:photoId] readWithCallback:^(MSGraphProfilePhoto *photo, MSOrcError *error) {
            
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
    }];
}

-(void)TestGetUserPhoto:(void (^) (Test*))result{
    
    return [[self.Client.users getById:self.TestMail].photo readWithCallback:^(MSGraphProfilePhoto *photo, MSOrcError *error) {
        
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
    
    return [[self.Client.users getById:self.TestMail].drive readWithCallback:^(MSGraphDrive *drive, MSOrcError *error) {
        
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
        
        [[[self.Client.users getById:self.TestMail].drive.root.children getById:itemId] readWithCallback:^(MSGraphItem *item, MSOrcError *error) {
            
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

-(void)TestCreateFileWithContent:(void (^) (Test*))result{
    /*
    MSGraphItem *itemToAdd = [self getFileItem];
    NSData *content =[@"Test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    NSInputStream* contentStream = [NSInputStream inputStreamWithData:content];
    //Create file
    return [[self.Client.users getById:self.TestMail].drive.root.children add:itemToAdd callback:^(MSGraphItem *addedItem, MSOrcError *error) {
        //Put content to file
       
        [[[[self.Client.users getById:self.TestMail].drive.root.children getById:addedItem._id].content putContent: contentStream callback:^(int returnValue, MSOrcError *error) {
            
            //Get file content
            [[[[self.Client.users getById:self.TestMail].files getById:addedItem._id].content stream contentWithCallback:^(NSStream *addedContent, MSOrcError *error) {
                
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
                    
                    [[[[self.Client.users getById:self.TestMail].files getById:addedItem._id] addCustomHeaderWithName:@"If-Match" value:@"*"]
                      deleteWithCallback:^(int status, MSOrcError *error) {
                          
                          if(error!= nil)
                              NSLog(@"Error: %@", error);
                          
                    }];
                }
                
                result(test);
            }];
        }];
    }];*/
         
         Test *test = [Test alloc];
         test.executionMessages = [NSMutableArray array];
         test.passed = FALSE;
         result(test);
}

- (MSGraphMessage *)getSampleMessage:(NSString *)subject to:(NSString *)to cc:(NSString *)cc {
    
    MSGraphMessage *message = [[MSGraphMessage alloc]init];
    //To recipient
    MSGraphRecipient *toRecipient = [[MSGraphRecipient alloc] init];
    MSGraphEmailAddress* email = [[ MSGraphEmailAddress alloc]init];
    [email setAddress:to];
    [toRecipient setEmailAddress:email];
    
    NSMutableArray *toRecipients = [[NSMutableArray alloc]init];
    [toRecipients addObject:toRecipient];
    [message setToRecipients:toRecipients];
    
    //Cc recipient
    if(![cc isEqualToString:@""]){
        MSGraphRecipient *ccRecipient = [[ MSGraphRecipient alloc] init];
        MSGraphEmailAddress* emailCc = [[ MSGraphEmailAddress alloc]init];
        [emailCc setAddress:cc];
        [ccRecipient setEmailAddress:emailCc];
        NSMutableArray *ccRecipients = [[NSMutableArray alloc]init];
        [toRecipients addObject:ccRecipient];
        [message setToRecipients:ccRecipients];
    }
    
    //Body & Subject
    [message setSubject:subject];
    MSGraphItemBody *body = [[ MSGraphItemBody alloc]init];
    [body setContent:@"This is the email body"];
    [message setBody:body];
    
    return message;
}

- (MSGraphEvent *)getSampleEvent {
    
    MSGraphEvent *event= [[MSGraphEvent alloc]init];
    event.Subject = @"Today's appointment";
    event.Start = [NSDate date];
    event.End = [[NSDate date] dateByAddingTimeInterval: 3600];
    MSGraphImportance importance = MSGraphImportanceHigh;
    event.Importance = importance;
    
    //Event Body
    MSGraphItemBody *itemBody = [[MSGraphItemBody alloc] init];
    itemBody.Content = @"This is the appointment info";
    
    MSGraphBodyType bt = MSGraphBodyTypeText;
    itemBody.ContentType = bt;
    event.Body = itemBody;
    
    // Attendees
    MSGraphAttendee *attendee1 = [[MSGraphAttendee alloc]init];
    MSGraphEmailAddress *email = [[MSGraphEmailAddress alloc]init];
    
    email.Address = self.TestMail;
    attendee1.EmailAddress = email;
    
    NSMutableArray *attendees = [[NSMutableArray alloc] init];
    [attendees addObject:attendee1];
    
    event.Attendees = (NSMutableArray *)attendees;
    
    return event;
}

- (MSGraphItem *)getFileItem {
    
    NSString *fileName = [[[NSUUID UUID] UUIDString] stringByAppendingString:@".txt"];
    MSGraphItem *item = [[MSGraphItem alloc] init];
    
    MSGraphFile *file = [[MSGraphFile alloc]init];
    
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
