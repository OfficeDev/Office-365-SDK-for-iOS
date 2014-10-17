//
//  BaseTestRunner.h
//  office365-e2end-tests
//
//  Created by Gustavo on 7/23/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseTestRunner : NSObject

-(NSMutableArray*)getTests;
-(NSURLSessionDataTask*)Run : (NSString*)testName completionHandler:(void (^) (id test))result;

@end