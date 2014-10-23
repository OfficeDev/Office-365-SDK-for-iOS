/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@interface BaseTestRunner : NSObject

-(NSMutableArray*)getTests;
-(NSURLSessionDataTask*)Run : (NSString*)testName completionHandler:(void (^) (id test))result;

@end