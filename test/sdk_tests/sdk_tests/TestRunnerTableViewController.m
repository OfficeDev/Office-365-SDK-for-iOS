/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "TestRunnerTableViewController.h"

@implementation TestRunnerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Run Selected" style:UIBarButtonItemStylePlain target:self action:@selector(runSelected:)];
    
    NSArray *buttons = [[NSArray alloc] init];
    buttons = [buttons arrayByAddingObject:self.navigationItem.rightBarButtonItem];
    buttons = [buttons arrayByAddingObject:anotherButton];
    self.navigationItem.rightBarButtonItems = buttons;
    
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
    return [self.Tests count];
}

- (IBAction)changeSwitchValue:(UISwitch *)sender {
    
    Test *test = [self.Tests objectAtIndex:sender.tag];
    test.selected = sender.on;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    Test *test = [self.Tests objectAtIndex:indexPath.row];
    UILabel* label = (UILabel *)[cell.contentView.subviews objectAtIndex:1];
    label.text = test.displayName;
    
    UISwitch *_switch = ((UISwitch*)[cell.contentView.subviews objectAtIndex:0]);
                                     //subviews:1]);
    
    _switch.tag = indexPath.row;
    
    [_switch setOn:test.selected];
    
    if (test.executionMessages != nil) {
        
        if (test.passed) {
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"passed.png"]];
        }
        else if (!test.passed) {
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"failed.png"]];
        }
    }
    else {
        cell.accessoryView = nil;
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
            [[self.Tests objectAtIndex:i] run:^(Test *result) {
                
                Test *test = [self.Tests objectAtIndex:i];
                test.passed = result.passed;
                test.executionMessages = result.executionMessages;
                executed++;
                
                [self.tableView reloadData];
                
                if(executed >= [self.Tests count]) [spinner stopAnimating];

            }];
        }
        @catch (NSException *e) {
            NSLog(@"Exception: %@", e);
        }
    }
}

- (IBAction)runSelected:(id)sender {
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:spinner];
    spinner.hidesWhenStopped = YES;
    
    [spinner startAnimating];
    
    __block int executed = 0;
    __block int toExecute = 0;
    
    for (NSUInteger i = 0; i < [self.Tests count]; i++) {

        __block Test *test = [self.Tests objectAtIndex:i];
        
        if(test.selected){
            toExecute++;
            @try {
                
                [test run:^(Test *result) {
                    ;
                    test.passed = result.passed;
                    test.executionMessages = result.executionMessages;
                    
                    executed++;
                    
                    [self.tableView reloadData];
                        
                    if(executed >= toExecute) [spinner stopAnimating];
                    

                }];
            }
            @catch (NSException *e) {
                NSLog(@"Exception: %@", e);
                
                if(executed >= toExecute) [spinner stopAnimating];
                

            }
        }
    }
    
    if (toExecute == 0) [spinner stopAnimating];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Test *test = [self.Tests objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"viewDetailSegue" sender:test];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"viewDetailSegue"]){
        TestRunDetailViewController *vc =  segue.destinationViewController;
        vc.testRunned = (Test*)sender;
    }
}
@end
