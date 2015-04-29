
#import "MSGraphTestRunner.h"

@implementation MSGraphTestRunner
-(id)initWithClient : (MSGraphClient*)client{
    self.Client = client;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString* mail = [userDefaults objectForKey: @"TestMail"];
    self.TestMail = mail == nil ? @"":mail ;
    return self;
}

-(NSURLSessionTask *)Run : (NSString *)testName completionHandler:(void (^) (id test))result{
    
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
    
    return nil;
}

-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithData:self :@"TestGetApplications" :@"Get applications" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetContacts" :@"Get contacts" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetDeviceConfiguration" :@"Get device configuration" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetDevices" :@"Get devices" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetGroups" :@"Get groups" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetDirectoryRoles" :@"Get directory roles" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetDirectoryRoleTemplates" :@"Get directory role templates" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetServicePrincipals" :@"Get service principals" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetTenantDetails" :@"Get tenant details" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUsers" :@"Get users" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetSubscribedSkus" :@"Get suscribed skus" ]];
    
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUserAppRoleAssignments" :@"Get user's app role assigments" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetOauth2PermissionGrants" :@"Get user's Oauth2 permission grants" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetOwnedDevices" :@"Get user's owned devices" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetRegisteredDevices" :@"Get user's registered devices" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetMemberOf" :@"Get user's member of" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetMemberOfById" :@"Get user's member of by Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetCreatedObjects" :@"Get user's created objects" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetOwnedObjects" :@"Get user's owned objects" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetOwnedObjectsById" :@"Get user's owned objects by Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetMessages" :@"Get user's messages" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetMessagesById" :@"Get user's messages by Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestSendMessage" :@"Send message" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetCalendars" :@"Get user's calendars" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetCalendarById" :@"Get user's calendars by Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetDefaultCalendar" :@"Get user's default calendar" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetCalendarGroups" :@"Get user's calendar groups" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetCalendarById" :@"Get user's calendar group by Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetEvents" :@"Get user's events" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetEventsById" :@"Get user's event by Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateEvents" :@"Create events" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestUpdateEvents" :@"Update events" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestDeleteEvents" :@"Delete events" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetCalendarView" :@"Get user's calendar view" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUserPhoto" :@"Get user's photo" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUserPhotos" :@"Get user's photos" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUserPhotoById" :@"Get user's photo by Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUserDrive" :@"Get user's drive" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUserFiles" :@"Get user's files" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestGetUserFilesById" :@"Get user's files by Id" ]];
    [array addObject:[[Test alloc] initWithData:self :@"TestCreateFileWithContent" :@"Create file with content" ]];
    
    return array;
}

-(NSURLSessionTask*)TestGetApplications:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[self.Client getapplications] readWithCallback:^(NSArray<MSGraphApplication> *applications, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && applications != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetContacts:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[self.Client getcontacts] readWithCallback:^(NSArray<MSGraphContact> *contacts, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && contacts != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetDeviceConfiguration:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[self.Client getdeviceConfiguration] readWithCallback:^(NSArray<MSGraphDeviceConfiguration> *deviceConfigurations, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && deviceConfigurations != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetDevices:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[self.Client getdevices] readWithCallback:^(NSArray<MSGraphDevice> *devices, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && devices != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetGroups:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[self.Client getgroups] readWithCallback:^(NSArray<MSGraphGroup> *groups, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && groups != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetDirectoryRoles:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[self.Client getdirectoryRoles] readWithCallback:^(NSArray<MSGraphDirectoryRole> *directoryRoles, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && directoryRoles != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetDirectoryRoleTemplates:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[self.Client getdirectoryRoleTemplates] readWithCallback:^(NSArray<MSGraphDirectoryRoleTemplate> *directoryRoleTemplates, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && directoryRoleTemplates != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetServicePrincipals:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[self.Client getservicePrincipals] readWithCallback:^(NSArray<MSGraphServicePrincipal> *servicePrincipals, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && servicePrincipals != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetTenantDetails:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[self.Client gettenantDetails] readWithCallback:^(NSArray<MSGraphTenantDetail> *tenantDetails, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && tenantDetails != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetUsers:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[self.Client getusers] top:1] readWithCallback:^(NSArray<MSGraphUser> *users, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && users != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetSubscribedSkus:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[self.Client getsubscribedSkus] readWithCallback:^(NSArray<MSGraphSubscribedSku> *subscribedSkus, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && subscribedSkus != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetUserAppRoleAssignments:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getappRoleAssignments] readWithCallback:^(NSArray<MSGraphAppRoleAssignment> *appRoleAssignments, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && appRoleAssignments != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetOauth2PermissionGrants:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getoauth2PermissionGrants] readWithCallback:^(NSArray<MSGraphOAuth2PermissionGrant> *oAuth2PermissionGrants, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && oAuth2PermissionGrants != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetOwnedDevices:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getownedDevices] readWithCallback:^(NSArray<MSGraphDirectoryObject> *directoryObjects, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && directoryObjects != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetRegisteredDevices:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getregisteredDevices] readWithCallback:^(NSArray<MSGraphDirectoryObject> *directoryObjects, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && directoryObjects != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetMemberOf:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getmemberOf] readWithCallback:^(NSArray<MSGraphDirectoryObject> *directoryObjects, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && directoryObjects != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetMemberOfById:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getmemberOf] readWithCallback:^(NSArray<MSGraphDirectoryObject> *directoryObjects, MSODataException *exception) {
        
        if (exception != nil) {
            
            result([self handleException:exception]);
            
            return;
        }
        
        NSString *memberOfId = directoryObjects == nil ? @"" : [[directoryObjects objectAtIndex:0] objectId];
        
        [[[[[self.Client getusers] getById:self.TestMail] getmemberOfById:memberOfId] readWithCallback:^(MSGraphDirectoryObject *directoryObject, MSODataException *exception) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(exception == nil && directoryObject != nil)
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(exception!= nil)
                    message = [message stringByAppendingString: [exception localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetCreatedObjects:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getcreatedObjects] readWithCallback:^(NSArray<MSGraphDirectoryObject> *directoryObjects, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && directoryObjects != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetOwnedObjects:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getownedObjects] readWithCallback:^(NSArray<MSGraphDirectoryObject> *directoryObjects, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && directoryObjects != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetOwnedObjectsById:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getownedObjects] readWithCallback:^(NSArray<MSGraphDirectoryObject> *directoryObjects, MSODataException *exception) {
        
        if (exception != nil) {
            
            result([self handleException:exception]);
            
            return;
        }
        
        NSString *ownedObjectId = directoryObjects == nil ? @"" : [[directoryObjects objectAtIndex:0] objectId];
        
        [[[[[self.Client getusers] getById:self.TestMail] getownedObjectsById:ownedObjectId] readWithCallback:^(MSGraphDirectoryObject *directoryObject, MSODataException *exception) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(exception == nil && directoryObject != nil)
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(exception!= nil)
                    message = [message stringByAppendingString: [exception localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetMessages:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getMessages] readWithCallback:^(NSArray<MSGraphMessage> *messages, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && messages != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetMessagesById:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getMessages] readWithCallback:^(NSArray<MSGraphMessage> *messages, MSODataException *exception) {
        
        if (exception != nil) {
            
            result([self handleException:exception]);
            
            return;
        }
        
        NSString *messageId = messages == nil ? @"" : [[messages objectAtIndex:0] id];
        
        [[[[[self.Client getusers] getById:self.TestMail] getMessagesById:messageId] readWithCallback:^(MSGraphMessage *messageItem, MSODataException *exception) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(exception == nil && messageItem != nil)
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(exception!= nil)
                    message = [message stringByAppendingString: [exception localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestSendMessage:(void (^) (Test*))result{
    MSGraphMessage *newMessage = [self getSampleMessage:@"My Subject" : self.TestMail : @""];
    
    //Send Mail
    NSURLSessionTask* task = [[[[self.Client getusers] getById:self.TestMail] operations] sendMailWithMessage:newMessage saveToSentItems:true callback:^(int returnValue, MSODataException *exception) {
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = @"";
        
        
        if(exception== nil){
            message = @"Ok - ";
            passed = true;
        }else{
            message = [@"Not - " stringByAppendingString:[exception localizedDescription]];
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetCalendars:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getCalendars] readWithCallback:^(NSArray<MSGraphCalendar> *calendars, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && calendars != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetCalendarById:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getCalendars] readWithCallback:^(NSArray<MSGraphCalendar> *calendars, MSODataException *exception) {
        
        if (exception != nil) {
            
            result([self handleException:exception]);
            
            return;
        }
        
        NSString *calendarId = calendars == nil ? @"" : [[calendars objectAtIndex:0] id];
        
        [[[[[[self.Client getusers] getById:self.TestMail] getCalendars] getById:calendarId] readWithCallback:^(MSGraphCalendar *calendarItem, MSODataException *exception) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(exception == nil && calendarItem != nil)
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(exception!= nil)
                    message = [message stringByAppendingString: [exception localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetDefaultCalendar:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getCalendar] readWithCallback:^(MSGraphCalendar *calendar, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && calendar != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetCalendarGroups:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getCalendarGroups] readWithCallback:^(NSArray<MSGraphCalendarGroup> *calendarGroups, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && calendarGroups != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetCalendarGroupById:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getCalendarGroups] readWithCallback:^(NSArray<MSGraphCalendarGroup> *calendarGroups, MSODataException *exception) {
        
        if (exception != nil) {
            
            result([self handleException:exception]);
            
            return;
        }
        
        NSString *calendarGroupId = calendarGroups == nil ? @"" : [[calendarGroups objectAtIndex:0] id];
        
        [[[[[[self.Client getusers] getById:self.TestMail] getCalendarGroups] getById:calendarGroupId] readWithCallback:^(MSGraphCalendarGroup *calendarGroup, MSODataException *exception) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(exception == nil && calendarGroup != nil)
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(exception!= nil)
                    message = [message stringByAppendingString: [exception localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetEvents:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getEvents ] readWithCallback:^(NSArray<MSGraphEvent> *events, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && events != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetEventsById:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getEvents] readWithCallback:^(NSArray<MSGraphEvent> *events, MSODataException *exception) {
        
        if (exception != nil) {
            
            result([self handleException:exception]);
            
            return;
        }
        
        NSString *eventId = events == nil ? @"" : [[events objectAtIndex:0] id];
        
        [[[[[[self.Client getusers] getById:self.TestMail]getEvents] getById:eventId] readWithCallback:^(MSGraphEvent *event, MSODataException *exception) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(exception == nil && event != nil)
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(exception!= nil)
                    message = [message stringByAppendingString: [exception localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestCreateEvents:(void (^) (Test*))result{
    MSGraphEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getEvents] addEvent:event callback:^(MSGraphEvent *addedEvent, MSODataException *e) {
        
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
        [[[[[[self.Client getusers] getById:self.TestMail]getEvents]getById:addedEvent.Id]deleteEvent:^(int status, MSODataException *error) {
            if(error!= nil)
                NSLog(@"Error: %@", error);
        }]resume];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestUpdateEvents:(void (^) (Test*))result{
    MSGraphEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getEvents] addEvent:event callback:^(MSGraphEvent *addedEvent, MSODataException *e) {
        
        NSString *updatedSubject = [@"Updated" stringByAppendingString:event.Subject];
        event.Subject = updatedSubject;
        // Update Event
        [[[[[[self.Client getusers] getById:self.TestMail] getEvents] getById:addedEvent.Id]updateEvent:event callback:^(MSGraphEvent *updatedEvent, MSODataException *error) {
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
            [[[[[[self.Client getusers] getById:self.TestMail]getEvents]getById:addedEvent.Id]deleteEvent:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        } ]resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestDeleteEvents:(void (^) (Test*))result{
    MSGraphEvent *event = [self getSampleEvent];
    //Create Event
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getEvents] addEvent:event callback:^(MSGraphEvent *addedEvent, MSODataException *e) {
        //Delete event
        [[[[[[self.Client getusers] getById:self.TestMail]getEvents]getById:addedEvent.Id]deleteEvent:^(int status, MSODataException *error) {
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

-(NSURLSessionTask*)TestGetCalendarView:(void (^) (Test*))result{
    MSGraphEvent *newEvent = [self getSampleEvent];
    NSURLSessionTask* task = [[[[self.Client getusers] getById:self.TestMail]  getEvents] addEvent:newEvent callback:^(MSGraphEvent *addedEvent, MSODataException *e) {
        
        [[[[[[[self.Client getusers] getById:self.TestMail] getCalendarView] addCustomParametersWithName:@"startdatetime" value:newEvent.Start] addCustomParametersWithName:@"enddatetime" value:newEvent.End ] readWithCallback:^(NSArray<MSGraphEvent> *events, MSODataException *error) {
            
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
            [[[[[[self.Client getusers] getById:self.TestMail] getEvents]getById:addedEvent.Id] deleteEvent:^(int status, MSODataException *error) {
                if(error!= nil)
                    NSLog(@"Error: %@", error);
            }]resume];
            
            result(test);
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetUserPhotos:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getUserPhotos] readWithCallback:^(NSArray<MSGraphPhoto> *photos, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && photos != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetUserPhotoById:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getUserPhotos] readWithCallback:^(NSArray<MSGraphPhoto> *photos, MSODataException *exception) {
        
        if (exception != nil) {
            
            result([self handleException:exception]);
            
            return;
        }
        
        NSString *photoId = photos == nil ? @"" : [[photos objectAtIndex:0] id];
        
        [[[[[[self.Client getusers] getById:self.TestMail]getUserPhotos] getById:photoId] readWithCallback:^(MSGraphPhoto *photo, MSODataException *exception) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(exception == nil && photo != nil)
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(exception!= nil)
                    message = [message stringByAppendingString: [exception localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetUserPhoto:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getUserPhoto] readWithCallback:^(MSGraphPhoto *photo, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && photo != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetUserDrive:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getdrive] readWithCallback:^(MSGraphDrive *drive, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && drive != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetUserFiles:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getfiles] readWithCallback:^(NSArray<MSGraphItem> *items, MSODataException *exception) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        NSString* message = @"";
        if(exception == nil && items != nil)
        {
            passed = true;
            message = @"Ok - ";
        }else{
            message = @"Not - ";
            if(exception!= nil)
                message = [message stringByAppendingString: [exception localizedDescription]];
        }
        
        test.Passed = passed;
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionTask*)TestGetUserFilesById:(void (^) (Test*))result{
    
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail] getfiles] readWithCallback:^(NSArray<MSGraphItem> *items, MSODataException *exception) {
        
        if (exception != nil) {
            
            result([self handleException:exception]);
            
            return;
        }
        
        NSString *itemId = items == nil ? @"" : [[items objectAtIndex:0] id];
        
        [[[[[[self.Client getusers] getById:self.TestMail] getfiles] getById:itemId] readWithCallback:^(MSGraphItem *item, MSODataException *exception) {
            
            BOOL passed = false;
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            NSString* message = @"";
            if(exception == nil && item != nil)
            {
                passed = true;
                message = @"Ok - ";
            }else{
                message = @"Not - ";
                if(exception!= nil)
                    message = [message stringByAppendingString: [exception localizedDescription]];
            }
            
            test.Passed = passed;
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }] resume];
    }];
    
    return task;
}

-(NSURLSessionTask*)TestCreateFileWithContent:(void (^) (Test*))result{
    
    MSGraphItem *itemToAdd = [self getFileItem];
    NSData *content =[@"Test Message content" dataUsingEncoding: NSUTF8StringEncoding];
    NSInputStream* contentStream = [NSInputStream inputStreamWithData:content];
    //Create file
    NSURLSessionTask *task = [[[[self.Client getusers] getById:self.TestMail ] getfiles] addEntity:itemToAdd callback:^(MSGraphItem *addedItem, MSODataException *error) {
        //Put content to file
        [[[[[[[[self.Client getusers] getById:self.TestMail ] getfiles]getById:addedItem.id] asFile] operations] uploadContentWithContentStream:contentStream callback:^(int returnValue, MSODataException *exception) {
            
            //Get file content
            [[[[[[[[self.Client getusers] getById:self.TestMail ] getfiles]getById:addedItem.id] asFile] operations] contentWithCallback:^(NSStream *addedContent, MSODataException *exception) {
                
                BOOL passed = false;
                
                Test *test = [Test alloc];
                test.ExecutionMessages = [NSMutableArray array];
                
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
                
                test.Passed = passed;
                [test.ExecutionMessages addObject:message];
                
                //Cleanup
                if (addedItem != nil) {
                    
                    [[[[[[[self.Client getusers] getById:self.TestMail ] getfiles]getById:addedItem.id] addCustomHeaderWithName:@"If-Match" value:@"*"]
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

-(MSGraphMessage*) getSampleMessage : (NSString*) subject  : (NSString*) to  : (NSString*) cc   {
    MSGraphMessage *message = [[MSGraphMessage alloc]init];
    //To recipient
    MSGraphRecipient *toRecipient = [[MSGraphRecipient alloc] init];
    MSGraphEmailAddress* email = [[ MSGraphEmailAddress alloc]init];
    [email setAddress:to];
    [toRecipient setEmailAddress:email];
    
    NSMutableArray *toRecipients = [[NSMutableArray alloc]init];
    [toRecipients addObject:toRecipient];
    [message setToRecipients:(NSMutableArray< MSGraphRecipient>*)toRecipients];
    
    //Cc recipient
    if(![cc isEqualToString:@""]){
        MSGraphRecipient *ccRecipient = [[ MSGraphRecipient alloc] init];
        MSGraphEmailAddress* emailCc = [[ MSGraphEmailAddress alloc]init];
        [emailCc setAddress:cc];
        [ccRecipient setEmailAddress:emailCc];
        NSMutableArray< MSGraphRecipient> *ccRecipients = (NSMutableArray< MSGraphRecipient>*)[[NSMutableArray alloc]init];
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

-(MSGraphEvent*) getSampleEvent{
    
    MSGraphEvent *event= [[MSGraphEvent alloc]init];
    event.Subject = @"Today's appointment";
    event.Start = [NSDate date];
    event.End = [[NSDate date] dateByAddingTimeInterval: 3600];
    MSGraphImportance importance = MSGraph_Importance_High;
    event.Importance = importance;
    
    //Event Body
    MSGraphItemBody *itemBody = [[MSGraphItemBody alloc] init];
    itemBody.Content = @"This is the appointment info";
    
    MSGraphBodyType bt = MSGraph_BodyType_Text;
    itemBody.ContentType = bt;
    event.Body = itemBody;
    
    // Attendees
    MSGraphAttendee *attendee1 = [[MSGraphAttendee alloc]init];
    MSGraphEmailAddress *email = [[MSGraphEmailAddress alloc]init];
    
    email.Address = self.TestMail;
    attendee1.EmailAddress = email;
    
    NSMutableArray *attendees = [[NSMutableArray alloc] init];
    [attendees addObject:attendee1];
    
    event.Attendees = (NSMutableArray<MSGraphAttendee>*)attendees;
    
    return event;
}

- (MSGraphItem *)getFileItem {
    
    NSString *fileName = [[[NSUUID UUID] UUIDString] stringByAppendingString:@".txt"];
    MSGraphItem *item = [[MSGraphItem alloc] init];
    
    [item setType:@"File"];
    [item setName:fileName];
    return item;
}

- (Test *)handleException:(MSODataException *)exception {
    
    Test *test = [Test alloc];
    
    test.ExecutionMessages = [NSMutableArray array];
    [test.ExecutionMessages addObject:[exception localizedDescription]];
    test.Passed = false;
    
    return test;
}

@end
