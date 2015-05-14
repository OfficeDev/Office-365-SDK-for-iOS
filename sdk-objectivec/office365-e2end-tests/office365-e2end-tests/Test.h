/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "BaseTestRunner.h"

@interface Test : NSObject

@property (nonatomic, strong) NSMutableArray *executionMessages;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic) BOOL passed;
@property (nonatomic) BOOL selected;
@property (nonatomic, strong) BaseTestRunner *testRunner;

- (id)initWithData:(BaseTestRunner *)testRunner name:(NSString *)name displayName:(NSString *)displyName;
- (void)run:(void(^)(Test *))result;

@end