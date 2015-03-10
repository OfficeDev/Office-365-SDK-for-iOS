/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

#import <office365_files_sdk/office365_files_sdk.h>
#import <office365_odata_base/office365_odata_base.h>
#import <office365_exchange_sdk/office365_exchange_sdk.h>
#import <office365_discovery_sdk/office365_discovery_sdk.h>
#import <office365_directory_sdk/office365_directory_sdk.h>

@protocol Runner

@optional
-(NSURLSessionDataTask*)Run : (NSString*)testName completionHandler:(void (^) (id test))result;

@end
@interface BaseTestRunner : NSObject<Runner>

-(NSMutableArray*)getTests;

@end