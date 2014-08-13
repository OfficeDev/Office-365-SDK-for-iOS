//
//  BaseTestRunner.h
//  office365-e2end-tests
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseTestRunner : NSObject

-(NSMutableArray*)getTests;
-(NSURLSessionDataTask*)Run : (NSString*)testName completionHandler:(void (^) (id test))result;

@end