/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

#import "office365_files_sdk.h"
#import "office365_exchange_sdk.h"
#import "office365_discovery_sdk.h"
#import "office365_onenote_sdk.h"
#import "office365_graph_sdk.h"

@protocol Runner

@optional
-(void)run:(NSString*)testName completionHandler:(void (^)(id test))result;

@end

@interface BaseTestRunner : NSObject<Runner>

- (NSMutableArray *)getTests;

@end