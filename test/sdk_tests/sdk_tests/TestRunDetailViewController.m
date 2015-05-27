/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "TestRunDetailViewController.h"

@implementation TestRunDetailViewController

-(void) initWithTest : (Test *)test{
    self.testRunned = test;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.testSummary.numberOfLines = 0;
    self.testName.text = self.testRunned.name;
    
    NSString *text = @"";
    
    for (NSUInteger i = 0; i < self.testRunned.executionMessages.count; i++) {
        
        text = [text stringByAppendingString:[self.testRunned.executionMessages objectAtIndex:i]];
        text = [text stringByAppendingString:@"\n"];
    }
    
    self.testSummary.text = text;
}

@end