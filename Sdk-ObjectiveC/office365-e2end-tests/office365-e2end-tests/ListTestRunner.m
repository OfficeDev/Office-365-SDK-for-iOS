//
//  ListTests.m
//  office365-e2end-tests
//
//  Created by Gustavo on 7/23/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "ListTestRunner.h"

#import <office365-lists-sdk/ListEntity.h>
#import <office365-lists-sdk/ListItem.h>
#import <office365-lists-sdk/ListField.h>
#import "TestParameters.h"
#import "Test.h"

@implementation ListTestRunner

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *test))result{
    
    if ([testName isEqualToString: @"TestGetLists"]) {
        return [self TestGetListsWithCompletionHandler:result];
    }
    if([testName isEqualToString:@"TestGetClientListError"]){
        return [self TestGetClientListsErrorWithCompletionHandler:result];
    }
    if([testName isEqualToString:@"TestGetListByName"]){
        return [self TestGetListWithCompletionHandler:result];
    }
    if([testName isEqualToString:@"TestNonexistentGetListByName"]){
        return [self TestGetNonexistentListWithCompletionHandler: result];
    }
    if([testName isEqualToString:@"TestGetListItems"]){
        return [self TestGetListItemWithCompletionHandler: result];
    }
    if ([testName isEqualToString:@"TestGetListFields"]) {
        return  [self TestGetListFieldWithCompletionHandler :result];
    }
    if([testName isEqualToString:@"TestCreateList"]){
        return  [self TestCreateListsWithCompletionHandler:result];
    }
    if([testName isEqualToString:@"TestDeleteList"])
    {
        return [self TestDeleteListsWithCompletionHandler:result];
    }
    else{
        return [self TestDefaultWithCompletionHandler:result];
    }
    
    return nil;
}

-(NSURLSessionDataTask*)TestGetListsWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] getLists:^(NSMutableArray *lists, NSError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = [lists count] > 0 ? @"Ok - ": @"Not - ";
        
        if([lists count] > 0){
            
            for (ListEntity *entity in lists) {
                if(entity.Id == nil || [entity getTitle] == nil){
                    passed = false;
                    break;
                }
                passed = true;
            }
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask *)TestGetClientListsErrorWithCompletionHandler:(void (^) (Test *))result{
    
    ListClient *client = [ListClient alloc];
    client = [client initWithUrl:nil  credentials:self.Parameters.Credentials];
    
    NSURLSessionDataTask *task = [client getLists:^(NSMutableArray *lists, NSError *error) {
   
        Test *test = [Test alloc];
        test.Passed = error.code == -1002;
        test.ExecutionMessages = [NSMutableArray array];
        result(test);
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetListWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] getList:@"Activos del sitio" callback:^(ListEntity *list, NSError *error) {
        
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = list != nil ? @"Ok - ": @"Not - ";
        
        if(list != nil && list.Id != nil && [list getTitle] != nil){
            passed = true;
        }

        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetNonexistentListWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] getList:@"Nonexistent list" callback:^(ListEntity *list, NSError *error) {
        
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = list == nil ? @"Ok - ": @"Not - ";
        
        if(list == nil){
            passed = true;
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetListItemWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] getListItems:@"Documentos" callback:^(NSMutableArray *listItems, NSError *error) {
        
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = listItems != nil ? @"Ok - ": @"Not - ";
        
        if([listItems count ] > 0 ){
            for(ListItem *item in listItems){
                NSString *title = [NSString alloc];
                title = [item getTitle] ;
                if(title != nil && ![title isEqual:[NSNull null]] && [title isEqualToString:@"TEsts"]){
                    passed = true;
                }
            }
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestGetListFieldWithCompletionHandler:(void (^) (Test*))result{
    
    NSURLSessionDataTask *task = [[self getClient] getListFields:@"AnahiTest" callback:^(NSMutableArray *listFields, NSError *error) {
        
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = listFields != nil ? @"Ok - ": @"Not - ";
        
        if([listFields count ] > 0 ){
            for(ListField *item in listFields){
                NSString *title = [NSString alloc];
                title = [item getTitle] ;
                if(title != nil && ![title isEqual:[NSNull null]] && [title isEqualToString:@"Campo Compuesto"]){
                    passed = true;
                }
            }
        }
        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        result(test);
    }];
    
    return task;
}

-(NSURLSessionDataTask*)TestCreateListsWithCompletionHandler:(void (^) (Test*))result{
    
    NSString *UUID = [[NSUUID UUID] UUIDString];
    
    ListEntity *newList = [[ListEntity alloc] init];
    newList.title = [@"List " stringByAppendingString:UUID];
    newList.description =@"Description 1";
    
    
    NSURLSessionDataTask *task = [[self getClient] createList:newList :^(ListEntity *list, NSError *error) {
        
        BOOL passed = false;
        
        Test *test = [Test alloc];
        
        test.ExecutionMessages = [NSMutableArray array];
        
        NSString* message = list != nil ? @"Ok - ": @"Not - ";
        
        if([[list getTitle] isEqualToString:newList.title] && [((NSString*)[list getData:@"Description"]) isEqualToString:newList.description] ){
            passed = TRUE;
        }

        
        test.Passed = passed;
        
        [test.ExecutionMessages addObject:message];
        
        
        [self cleanup:list :^(bool success, NSError *error) {
            if(!success)
                test.Passed = false;
            
            result(test);
        }];
    }];
    
    return task;
}


-(NSURLSessionDataTask*)TestDeleteListsWithCompletionHandler:(void (^) (Test*))result{
    
    NSString *UUID = [[NSUUID UUID] UUIDString];
    
    ListEntity *newList = [[ListEntity alloc] init];
    newList.title = [@"List " stringByAppendingString:UUID];
    newList.description =@"Description 1";
    
    NSURLSessionDataTask *taskCreate = [[self getClient] createList:newList :^(ListEntity *list, NSError *error) {

        NSURLSessionDataTask *taskDelete = [[self getClient] deleteList:list :^(bool success, NSError *derror) {
            
            Test *test = [Test alloc];
            
            test.ExecutionMessages = [NSMutableArray array];
            
            NSString* message = success ? @"Ok - ": @"Not - ";
            
            test.Passed = success;
            
            [test.ExecutionMessages addObject:message];
            
            result(test);
            
        }];
        
        [taskDelete resume];
    }];
    
    return taskCreate;
}

- (void) cleanup : (ListEntity *)list : (void (^)(bool success, NSError *error))callback{
    NSURLSessionDataTask *task = [[self getClient] deleteList:list :^(BOOL success, NSError *error) {
        callback(success, error);
    }];
    
    [task resume];
}


-(NSURLSessionDataTask*)TestDefaultWithCompletionHandler:(void (^) (Test *))result{

    NSURLSessionDataTask* task = [[self getClient] getLists:^(NSMutableArray *lists, NSError *error) {
        
        Test *test = [Test alloc];
        test.Passed = false;
        test.ExecutionMessages = [NSMutableArray array];
        result(test);
    }];
    
    return task;
}

-(ListClient*)getClient{
    
    if(self.Client != nil)
        return self.Client;
    
    ListClient *client = [ListClient alloc];
    self.Client = [client initWithUrl:self.Parameters.ServiceUrl  credentials:self.Parameters.Credentials];
    
    return self.Client;
}

-(NSMutableArray*)getTests{
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[[Test alloc] initWithName:@"TestGetLists" displayName:@"Get Lists" runner:self]];
    
    [array addObject:[[Test alloc] initWithName:@"TestGetClientListError" displayName:@"Get Client List Error" runner:self]];
    
   [array addObject:[[Test alloc] initWithName:@"TestGetListByName" displayName:@"Get List By Name" runner:self]];
    
   [array addObject:[[Test alloc] initWithName:@"TestNonexistentGetListByName" displayName:@"Get Nonexistent List By Name" runner:self]];
    
    [array addObject:[[Test alloc] initWithName:@"TestGetListItems" displayName:@"Get List Items" runner:self]];
    
    [array addObject:[[Test alloc] initWithName:@"TestGetListFields" displayName:@"Get List Fields" runner:self]];
    
    [array addObject:[[Test alloc] initWithName:@"TestCreateList" displayName:@"Create List" runner:self]];
    
    [array addObject:[[Test alloc] initWithName:@"TestDeleteList" displayName:@"Delete List" runner:self]];
    return array;
}



@end