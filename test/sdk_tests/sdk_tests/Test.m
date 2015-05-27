/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "Test.h"
#import "BaseTestRunner.h"

@implementation Test

@synthesize executionMessages = _executionMessages;
@synthesize name = _name;
@synthesize displayName = _displayName;
@synthesize passed = _passed;
@synthesize selected = _selected;
@synthesize testRunner = _testRunner;

-(id)initWithData:(BaseTestRunner *)testRunner name:(NSString *)name displayName:(NSString *)displyName {
    
    if (self = [super init]) {
        
        _testRunner = testRunner;
        _name = name;
        _displayName = displyName;
    }
    
    return self;
}

-(void)run:(void(^)(Test *))result {

    return [self.testRunner run:self.name completionHandler:^(id test) {
        result(test);
    }];
}

@end