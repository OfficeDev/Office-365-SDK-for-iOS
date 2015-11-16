/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

#//import "MSFiles.h"
#import "MSOutlook.h"
#import "MSDiscovery.h"
#import "MSOneNote.h"
#import "MSGraph.h"

@protocol Runner

@optional
-(void)run:(NSString*)testName completionHandler:(void (^)(id test))result;

@end

@interface BaseTestRunner : NSObject <Runner>

- (NSMutableArray *)getTests;

@end
