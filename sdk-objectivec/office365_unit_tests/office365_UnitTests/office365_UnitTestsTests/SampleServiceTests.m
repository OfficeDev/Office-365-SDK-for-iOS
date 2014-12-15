//
//  SampleServiceTests.m
//  office365_unit_tests
//
//  Created by Gustavo on 12/10/14.
//  Copyright (c) 2014 MSOpentech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import <office365_odata_base/office365_odata_base.h>
//#import <SampleService/SampleService.h>
#import "MSSampleContainerClient.h"
#import <office365_odata_base/NSString+NSStringExtensions.h>

@interface SampleServiceTests : XCTestCase

@property MSSampleContainerClient* client;
@property bool running;
@end

@implementation SampleServiceTests

- (void)setUp {
    [super setUp];
  
    //self.mocktail = [Mocktail startWithContentsOfDirectoryAtURL:[[NSBundle bundleForClass:[self class]] bundleURL]];
    
    MSODataDefaultDependencyResolver* resolver = [MSODataDefaultDependencyResolver alloc];
    MSODataOAuthCredentials* credentials = [MSODataOAuthCredentials alloc];
    [credentials addToken:@"fakeToken"];
    
    MSODataCredentialsImpl* credentialsImpl = [MSODataCredentialsImpl alloc];
    
    [credentialsImpl setCredentials:credentials];
    [resolver setCredentialsFactory:credentialsImpl];
    
    self.client = [[MSSampleContainerClient alloc] initWithUrl:@"http://localhost:8080/" dependencyResolver:resolver];
}

- (void)tearDown {
    [super tearDown];
}

//TODO: Enable when serialization issue with ints is ready
/*
-(void) testTwoParamsActionsFirstIsEntityTypeUri{
    //twoParamsActionsFirstIsEntityTypePOST.json
    self.running = true;
    __block int result = 0;
    
    NSURLSessionDataTask* task = [[[self.client getMe] getOperations] twoParamsActionsFirstIsEntityType:[self getSampleEntity] :false :^(int returnValue, MSODataException *error) {
        
        result = returnValue;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertEqual(result, 1);
}
*/
- (void)testGetNavigationList {
    //getNavigationsGET.json
    self.running = true;
    __block NSArray<MSSampleContainerAnotherEntity> *entities = nil;
    
    NSURLSessionDataTask* task = [[[self.client getMe] getNavigations] read:^(NSArray<MSSampleContainerAnotherEntity> *anotherEntities, MSODataException *error) {
        
        entities =anotherEntities;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertEqual([entities count], 1);
}

- (void)testGetNavigationItem {
    //getNavigationItemGET.json
    self.running = true;
    __block MSSampleContainerAnotherEntity *entity = nil;
    
    NSURLSessionDataTask* task = [[[[self.client getMe] getNavigations] getById:@"SomeId" ] read:^(MSSampleContainerAnotherEntity *anotherEntity, MSODataException *error) {
        
        entity =anotherEntity;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.SomeString isEqualToString:[self getAnotherEntity].SomeString]);
}

-(void) testGetNavigationItemWithSelect{
    //getNavigationItemWithSelectGET.json
    self.running = true;
    __block MSSampleContainerAnotherEntity *entity = nil;
    
    NSURLSessionDataTask* task = [[[[[self.client getMe] getNavigations] getById:@"SomeId" ] select:@"SomeProp, AnotherProp"] read:^(MSSampleContainerAnotherEntity *anotherEntity, MSODataException *error) {
        
        entity =anotherEntity;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.SomeString isEqualToString:[self getAnotherEntity].SomeString]);
}

//TODO: Enable when Raw is available after select
/*
-(void) testGetNavigationItemRawWithSelect{
    //getNavigationItemWithSelectGET.json
    self.running = true;
    __block NSString *jsonResult = nil;
    
    NSURLSessionDataTask* task = [[[[[self.client getMe]  getNavigations] getById:@"SomeId" ]  select:@"SomeProp, AnotherProp" ] readRaw:^(NSString *result, MSODataException *error) {
        
        jsonResult =result;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];

    NSString *expectedResponseString = @"{\"SomeString\":\"Some String\",\"Id\":\"3281EC0B-1AEB-49A4-A345-E64D732DA6D3\",\"@odata.type\":\"#Microsoft.SampleService.AnotherEntity\"}";
    XCTAssertNotNil(jsonResult);
    XCTAssertTrue([jsonResult isEqualToString:expectedResponseString]);
}
*/

-(void) testGetNavigationListWithSelectAndTop{
    //getNavigationsWithSelectAndTopGET.json
    self.running = true;
    __block NSArray<MSSampleContainerAnotherEntity> *entities = nil;
    
    NSURLSessionDataTask* task = [[[[[self.client getMe] getNavigations] select:@"SomeProp, AnotherProp" ] top:1] read:^(NSArray<MSSampleContainerAnotherEntity> *anotherEntities, MSODataException *error) {
        
        entities =anotherEntities;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertEqual([entities count], 1);
}

//TODO: testGetNavigationListRawWithSelectAndTop

-(void) testGetCollectionWithFilterAndExpand{
    //getCollectionsWithExpandAndFilter.json
    self.running = true;
    __block NSArray<MSSampleContainerSampleEntity> *entities = nil;
    
    NSURLSessionDataTask* task = [[[[self.client getservices] expand:@"SomeProp"] filter:@"SomeProp eq 'SomeString'" ] read:^(NSArray<MSSampleContainerSampleEntity> *sampleEntitys, MSODataException *error) {
        
        entities =sampleEntitys;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertEqual([entities count], 1);
}

-(void) testGetCollectionWithHeaders{
    //getCollectionsWithHeaders.json
    self.running = true;
    __block NSArray<MSSampleContainerSampleEntity> *entities = nil;
    
    NSURLSessionDataTask* task = [[[[self.client getservices] addCustomHeaderWithName:@"Header1" andValue:@"Value1"] addCustomHeaderWithName:@"Header2" andValue:@"Value2"] read:^(NSArray<MSSampleContainerSampleEntity> *sampleEntitys, MSODataException *error) {
        
        entities =sampleEntitys;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertEqual([entities count], 1);
}

//TODO: Enable when missing X-ClientService-ClientTag header is available
/*
-(void) testDefaultHeaders{
    self.running = true;
    __block NSArray<MSSampleContainerSampleEntity> *entities = nil;
    
    NSURLSessionDataTask* task = [[[self.client getservices] top:99 ] read:^(NSArray<MSSampleContainerSampleEntity> *sampleEntitys, MSODataException *error) {
        
        entities =sampleEntitys;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertEqual([entities count], 1);
}
*/
-(void) testDeleteNavigationItem{
    //deleteNavigationItemDELETE.json
    self.running = true;
    __block MSODataException *expectedError = nil;
    
    NSURLSessionDataTask* task = [[[[[self.client getMe] getNavigations] getById:@"SomeId" ] addCustomHeaderWithName:@"If-Match" andValue:@"*" ] deleteAnotherEntity:^(int status, MSODataException *error) {
        
        expectedError = error;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNil(expectedError);
}

-(void) testAddNavigationItem{
    //addNavigationItemPOST.json
    self.running = true;
    __block MSSampleContainerAnotherEntity *entity = nil;
    
    NSURLSessionDataTask* task = [[[self.client getMe] getNavigations] addAnotherEntity:[self getAnotherEntity] withCallback:^(MSSampleContainerAnotherEntity *anotherEntity, MSODataException *e) {
        
        entity =anotherEntity;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.SomeString isEqualToString:[self getAnotherEntity].SomeString]);
    
}

-(void) testUpdateNavigationItem{
    //updateNavigationItemPOST.json
    self.running = true;
    __block MSSampleContainerAnotherEntity *entity = nil;
    MSSampleContainerAnotherEntity *entityToUpdate = [self getAnotherEntity];
    entityToUpdate.SomeString = @"Some Updated String";
    
    NSURLSessionDataTask* task = [[[[[self.client getMe] getNavigations] getById:entityToUpdate.Id] addCustomHeaderWithName:@"IsPatch" andValue:@"yes" ] updateAnotherEntity:entityToUpdate withCallback:^(MSSampleContainerAnotherEntity * updatedEntity, MSODataException *error) {
        
        entity =updatedEntity;
        self.running = false;
    }];
    
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.SomeString isEqualToString:entityToUpdate.SomeString]);
}

-(void) testGetNavigationsWithParameters{
    //getNavigationsWithParameters.json
    self.running = true;
    __block NSArray<MSSampleContainerAnotherEntity> *entities = nil;
    
    NSURLSessionDataTask* task = [[[[self.client getMe] getNavigations] addCustomParameters:@"StringParam" :@"SomeValue"] read:^(NSArray<MSSampleContainerAnotherEntity> *anotherEntitys, MSODataException *error) {
        
        entities =anotherEntitys;
        self.running = false;
    }];
    
    //.addParameter("StringParam", param1)
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNotNil(entities);
    XCTAssertEqual([entities count], 1);

}


//TODO: Reactor this: add semaphore or get method to terminator methods
-(void)blockUntilFinish : (NSURLSessionDataTask*)task{
    
    while (self.running){}
}

-(MSSampleContainerSampleEntity*)getSampleEntity{
    MSSampleContainerSampleEntity *sampleEntity = [[MSSampleContainerSampleEntity alloc] init];
    sampleEntity.DisplayName = @"Some Display Name";
    sampleEntity.entityKey = @"Some Entity Key";
    sampleEntity.Id = @"5C338D75-CB90-4785-8667-CED25B3695BF";
    return sampleEntity;
}

-(MSSampleContainerAnotherEntity*) getAnotherEntity{
    MSSampleContainerAnotherEntity *anotherEntity = [[MSSampleContainerAnotherEntity alloc]init];
    anotherEntity.Id = @"3281EC0B-1AEB-49A4-A345-E64D732DA6D3";
    anotherEntity.SomeString=@"Some String";
    return anotherEntity;
}

@end