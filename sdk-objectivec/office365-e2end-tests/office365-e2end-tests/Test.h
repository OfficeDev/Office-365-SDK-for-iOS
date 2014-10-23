/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "BaseTestRunner.h"

@interface Test : NSObject

@property NSMutableArray *ExecutionMessages;
@property NSString *Name;
@property NSString *DisplayName;
@property BOOL Passed;
@property BaseTestRunner *TestRunner;

-(id) initWithData : (BaseTestRunner*) testRunner : (NSString *)name : (NSString *)displyName;
-(NSURLSessionDataTask*)Run :(void (^) (Test *))result;

@end