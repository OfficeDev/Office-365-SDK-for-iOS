//
//  FileTestTableViewController.m
//  office365-e2end-tests
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "ListTestTableViewController.h"
#import "LogInController.h"
#import "TestParameters.h"
#import "MailTestRunner.h"

@interface ListTestTableViewController ()

@end

@implementation ListTestTableViewController

LogInController *loginController;
TestParameters *testParameters;
MailTestRunner *testRunner;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    loginController = [[LogInController alloc] init];
    
    [[BaseController alloc] getMailClient:^(MSOEntityContainerClient *c) {
        testRunner = [[MailTestRunner alloc] initWithClient:c];
        testRunner.Parameters = testParameters;
        
        self.Tests = [testRunner getTests];
        
        [self.tableView reloadData];
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
 #pragma mark - Table view data source
 
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
 #warning Potentially incomplete method implementation.
 // Return the number of sections.
 return 0;
 }*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.Tests count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListTests" forIndexPath:indexPath];
    
    Test *test = [self.Tests objectAtIndex:indexPath.row];
    UILabel* label = (UILabel *)[cell .contentView viewWithTag:2];
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

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellAccessoryDetailButton){
    }
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}*/


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

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
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    
                    if(executed == [self.Tests count]) [spinner stopAnimating];
                });
            }];
            
            [task resume];
        }
        @catch (NSException *e) {
            NSLog(@"Exception: %@", e);
        }

        
    }
}

- (IBAction)RunSelectedTests:(id)sender {
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:spinner];
    spinner.hidesWhenStopped = YES;
    
    [spinner startAnimating];
    
    __block int executed = 0;
    __block int toExecute = 0;
    
    for (NSUInteger i = 0; i < [self.Tests count]; i++) {

        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        UISwitch* s = (UISwitch*)[cell viewWithTag:1];
        
        if(s.isOn){
            toExecute++;
            @try {
                NSURLSessionDataTask *task = [[self.Tests objectAtIndex:i] Run:^(Test *result) {
                
                    Test *test = [self.Tests objectAtIndex:i];
                    test.Passed = result.Passed;
                    test.ExecutionMessages = result.ExecutionMessages;
                    executed++;
                
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.tableView reloadData];
                    
                        if(executed == toExecute) [spinner stopAnimating];
                    });
                }];
            
                [task resume];
            }
            @catch (NSException *e) {
                NSLog(@"Exception: %@", e);
            }
        }
    }
}

-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Run";
}

-(void)changeButtonState{
    //self.RunAllTest.enabled = !self.RunAllTest.enabled;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self changeButtonState];
        //[spinner startAnimating];
        
        NSURLSessionDataTask *task = [[self.Tests objectAtIndex:indexPath.row] Run:^(Test *result) {
            Test *test = [self.Tests objectAtIndex:indexPath.row];
            test.Passed = result.Passed;
            test.ExecutionMessages = result.ExecutionMessages;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
               // [self disposeTest];
            });
        }];
        
        [task resume];
    }
}
@end