//
//  TestRunnerTableViewController.m
//  office365-e2end-tests
//
//  Created by Anahi Hojnadel on 11/13/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "TestRunnerTableViewController.h"

@implementation TestRunnerTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.Tests = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)loadInitialData {
    for (Test* test in self.TestRunner.getTests) {
        [self.Tests addObject:test];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.Tests count];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    NSString *testName= [self.Tests objectAtIndex:indexPath.row];
    cell.textLabel.text = testName;
    return cell;
}
*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    Test *test = [self.Tests objectAtIndex:indexPath.row];
    UILabel* label = (UILabel *)[cell.contentView viewWithTag:2];
    label.text = test.DisplayName;
    
    if(test.ExecutionMessages != nil){
        if(test.Passed){
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"passed.png"]];
        }
        if(!test.Passed){
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"failed.png"]];
        }
    }
    
    return cell;
}

- (IBAction)RunAllTests:(id)sender {
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:spinner];
    spinner.hidesWhenStopped = YES;
    
    [spinner startAnimating];
    
    __block int executed = 0;
    
    for (int i = 0; i < [self.Tests count]; i++) {
        @try {
            NSURLSessionDataTask *task = [[self.Tests objectAtIndex:i] Run:^(Test *result) {
                
                Test *test = [self.Tests objectAtIndex:i];
                test.Passed = result.Passed;
                test.ExecutionMessages = result.ExecutionMessages;
                executed++;
                
                [self.tableView reloadData];
                if(executed == [self.Tests count]) [spinner stopAnimating];
            }];
            
            [task resume];
        }
        @catch (NSException *e) {
            NSLog(@"Exception: %@", e);
        }
    }
}

@end
