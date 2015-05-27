/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

#import "files_services/files_services.h"
#import "outlook_services.h"
#import "discovery_services.h"
#import "onenote_services.h"
#import "unified_services.h"

@protocol Runner

@optional
-(void)run:(NSString*)testName completionHandler:(void (^)(id test))result;

@end

@interface BaseTestRunner : NSObject <Runner>

- (NSMutableArray *)getTests;

@end
