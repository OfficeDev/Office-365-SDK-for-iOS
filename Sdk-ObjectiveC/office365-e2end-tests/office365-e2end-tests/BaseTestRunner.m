//
//  BaseTestRunner.m
//  office365-e2end-tests
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "BaseTestRunner.h"

@implementation BaseTestRunner

-(NSMutableArray*)getTests{return nil;}

-(NSURLSessionDataTask*)Run : (NSString*)testName completionHandler:(void (^) (id test))result{
    
    return nil;
}

@end