//
//  Test.h
//  office365-e2end-tests
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTestRunner.h"

@interface Test : NSObject

@property NSMutableArray *ExecutionMessages;
@property NSString *Name;
@property NSString *DisplayName;
@property BOOL Passed;
@property BaseTestRunner *TestRunner;

-(NSURLSessionDataTask*)Run :(void (^) (Test *))result;

-(instancetype) initWithName:(NSString*) name displayName : (NSString*) displayName runner : (BaseTestRunner*) runner;

@end