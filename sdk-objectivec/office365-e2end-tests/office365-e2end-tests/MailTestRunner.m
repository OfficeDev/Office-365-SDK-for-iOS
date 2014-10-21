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

@implementation MailTestRunner

-(id)initWithClient : (MSOEntityContainerClient*)client{
    self.Client = client;
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
    
    // Folder tests
    if([testName isEqualToString:@"TestGetFolders"])return [self TestGetFolders:result];
    if([testName isEqualToString:@"TestGetFoldersById"])return [self TestGetFoldersById:result];
    if([testName isEqualToString:@"TestCreateFolder"])return [self TestCreateFolder:result];
    
    
    /*

    this.addTest(canRetrieveFolderById("Can retrieve folder by id", true));

    this.addTest(canDeleteFolder("Can delete folder", true));
    this.addTest(canMoveFolder("Can move folder", true));
    this.addTest(canCopyFolder("Can copy folder", true));
    this.addTest(canUpdateFolder("Can update folder", true));
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
    
        // [array addObject:[[Test alloc] initWithData:self :@"TestCreateFolder" :@"Create Folder" ]];
    
    //Mail Tests
    [array addObject:[[Test alloc] initWithData:self :@"TestGetMessages" :@"Get Messages" ]];
    

    
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
        
        if(e!= nil && newFolder.DisplayName == folderName ){
            message = @"Ok - ";
            passed = true;
        }else
        {
            message = @"Not - ";
        }
        
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
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
            [[[[[self.Client getMe] getContacts] getById:addedContact.Id] delete:^(id result, NSError * error) {
                NSLog(@"Error: %@", error);
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
        
        if(addedContact != nil && addedContact.DisplayName == newContact.DisplayName){
            passed = true;
        }
        
        test.Passed = passed;
        
        //Cleanup
        [[[[[self.Client getMe] getContacts] getById:addedContact.Id] delete:^(id result, NSError * error) {
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
        Test *test = [Test alloc];
        test.ExecutionMessages = [NSMutableArray array];
            //Delete
            [[[[[self.Client getMe] getContacts] getById:addedContact.Id] delete:^(id result, NSError * error) {
                BOOL passed = false;
                
                NSString* message = (error!= nil) ? @"Not - " : @"Ok - ";
                [test.ExecutionMessages addObject:message];
                
                if(error != nil){
                    [test.ExecutionMessages addObject: [error localizedDescription]];
                }else{
                    passed = true;
                }
                
                test.Passed = passed;
                
            }] resume];
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestUpdateContacts:(void (^) (Test*))result{
    MSOContact* newContact = [self getContact];
    
    //Create contact
    NSURLSessionDataTask *task = [[[self.Client getMe] getContacts] add:newContact :^(MSOContact *addedContact, NSError *error) {
        [newContact setDisplayName:@"New Contact Name"];
        
        [[[[self.Client getMe]getContacts]getById:newContact.Id] update:newContact :^(MSOContact *updatedEntity, NSError *error) {
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
            [[[[[self.Client getMe] getContacts] getById:updatedEntity.Id] delete:^(id result, NSError * error) {
                NSLog(@"Error: %@", error);
            }] resume];
            
            result(test);
        }];
        
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