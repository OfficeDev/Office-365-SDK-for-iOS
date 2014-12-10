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

- (void)testGetNavigationList {
    
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

//TODO: Reactor this: add semaphore or get method to terminator methods
-(void)blockUntilFinish : (NSURLSessionDataTask*)task{
    
    while (self.running){}
}
/*
-(MSSampleContainerSampleEntity*)getSampleEntity{
    return nil;
}*/

@end