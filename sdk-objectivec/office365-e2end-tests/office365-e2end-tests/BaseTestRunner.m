//
//  BaseTestRunner.m
//  office365-e2end-tests
//
//  Created by Gustavo on 7/23/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "BaseTestRunner.h"

@implementation BaseTestRunner

-(NSMutableArray*)getTests{return nil;}

-(NSURLSessionDataTask*)Run : (NSString*)testName completionHandler:(void (^) (id test))result{
    
    return nil;
}

@end