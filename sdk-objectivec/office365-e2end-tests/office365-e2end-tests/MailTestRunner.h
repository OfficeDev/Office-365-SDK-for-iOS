//
//  ListTests.h
//  office365-e2end-tests
//
//  Created by Gustavo on 7/23/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTestRunner.h"
#import "TestParameters.h"
#import "Test.h"
#import "LogInController.h"
#import <office365_exchange_sdk/office365_exchange_sdk-Prefix.pch>
#import <office365_exchange_sdk/MSOBaseODataContainer.h>
#import <office365_exchange_sdk/MSOEntityContainerClient.h>
#import <office365_exchange_sdk/MSOFolderCollectionFetcher.h>
#import <office365_exchange_sdk/MSOMessageCollectionFetcher.h>


@interface MailTestRunner : BaseTestRunner

@property TestParameters *Parameters;
@property MSOEntityContainerClient *Client;

-(NSURLSessionDataTask *)Run : (NSString *)testName completionHandler:(void (^) (Test *))result;

@end