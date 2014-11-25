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
    self.testName.text = self.testRunned.Name;
    
    NSString *text = @"";
    for (NSUInteger i = 0; i < self.testRunned.ExecutionMessages.count; i++)
    {
        text = [text stringByAppendingString:[self.testRunned.ExecutionMessages objectAtIndex:i]];
        text = [text stringByAppendingString:@"\n"];
    }
    
    self.testSummary.text = text;
}

@end
