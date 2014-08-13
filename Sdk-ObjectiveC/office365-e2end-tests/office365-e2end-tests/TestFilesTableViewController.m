//
//  TestFilesTableViewController.m
//  office365-e2end-tests
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "TestFilesTableViewController.h"
#import <office365-base-sdk/LoginClient.h>
#import "TestParameters.h"
#import "FileTestRunner.h"

@interface TestFilesTableViewController()

@end

@implementation TestFilesTableViewController

UIActivityIndicatorView *spinner;
LoginClient *loginClient;
TestParameters *testParameters;
FileTestRunner *testRunner;
NSMutableArray *testTasks;

- (void)viewDidLoad
{
    spinner = [self getSpinner];
    testTasks = [NSMutableArray array];
    [super viewDidLoad];
    [self logIn];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.Tests count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FileTestsCells" forIndexPath:indexPath];
    
    Test *test = [self.Tests objectAtIndex:indexPath.row];
    cell.textLabel.text = test.DisplayName;
    
    if(test.ExecutionMessages != nil){
        if(test.Passed){
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"passed.png"]];
        }
        if(!test.Passed){
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"failed.png"]];
        }
    }
    else {cell.accessoryView = nil;}
    
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Run";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        [self changeButtonState];
        [spinner startAnimating];

        NSURLSessionDataTask *task = [[self.Tests objectAtIndex:indexPath.row] Run:^(Test *result) {
            Test *test = [self.Tests objectAtIndex:indexPath.row];
            test.Passed = result.Passed;
            test.ExecutionMessages = result.ExecutionMessages;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                [self disposeTest];
            });
        }];
        
        [task resume];
    }
}

- (IBAction)Cancel:(id)sender {
    [self disposeTest];
}

- (IBAction)RunAllTests:(id)sender {
    
    [self logIn];
    [spinner startAnimating];
    [self changeButtonState];
    
    [self clear];
    
    __block int executed = 0;
    
    for (int i = 0; i < [self.Tests count]; i++) {
       __block NSURLSessionDataTask *task = [[self.Tests objectAtIndex:i] Run:^(Test *result) {
            
            if(task.state == NSURLSessionTaskStateCanceling){
                return ;
            }
            
            Test *test = [self.Tests objectAtIndex:i];
            test.Passed = result.Passed;
            test.ExecutionMessages = result.ExecutionMessages;
            executed++;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                
                if(executed == [self.Tests count]) {
                    [self disposeTest];
                }
            });
        }];
        [testTasks addObject: task];
    }
    [self runTask];
}

-(void)runTask{
    for (NSURLSessionDataTask *task in testTasks) {
        [task resume];
    }
}

-(void)disposeTest{
    [spinner stopAnimating];
    
    for (int i = 0; i < testTasks.count; i++) {
        [[testTasks objectAtIndex:i] cancel];
    }
    [testTasks removeAllObjects];
    [self changeButtonState];
}

-(void)changeButtonState{
  //  self.CancelBtn.enabled = self.RunAllTest.enabled;
    self.RunAllTest.enabled = !self.RunAllTest.enabled;
}

-(void)clear{
    for (int i = 0; i < [self.Tests count]; i++) {
        ((Test*)[self.Tests objectAtIndex:i]).ExecutionMessages = nil;
    }
    
    [self.tableView reloadData];
}

-(UIActivityIndicatorView*)getSpinner{
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:spinner];
    spinner.hidesWhenStopped = YES;
    
    return spinner;
}

-(void)logIn{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    loginClient = [[LoginClient alloc] initWithParameters:[userDefaults objectForKey: @"CliendId"]
                                                  :[userDefaults objectForKey: @"RedirectUrl"]
                                                  :@"https://lagashsystems365-my.sharepoint.com"
                                                  :[userDefaults objectForKey: @"AuthorityUrl"]
                   ];
    
    [loginClient login:false completionHandler:^(NSString *token, NSError *error) {
        
        if(error != nil){
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Adal Error" message:error.description delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
            
            [alert show];
            
        }else{
            
            testParameters = [TestParameters alloc];
            testParameters.Credentials = [[OAuthentication alloc] initWith:token];
            testParameters.ServiceUrl = @"https://lagashsystems365-my.sharepoint.com/personal/gustavoh_lagash_com";
            
            testRunner = [FileTestRunner alloc];
            testRunner.Parameters = testParameters;
            
            self.Tests = [testRunner getTests];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}

@end