//
//  FileTestTableViewController.m
//  office365-e2end-tests
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "ListTestTableViewController.h"
//#import "LogInController.h"
#import "TestParameters.h"
#import "ListTestRunner.h"
#import <office365-base-sdk/LoginClient.h>
@interface ListTestTableViewController ()

@end

@implementation ListTestTableViewController

//LogInController *loginController;
TestParameters *testParameters;
ListTestRunner *testRunner;
LoginClient *loginClient;

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
 //   loginController = [[LogInController alloc] init];//initWith:];
    
   [self LogIn];
    
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
    cell.textLabel.text = test.DisplayName;
    
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
        NSURLSessionDataTask *task = [[self.Tests objectAtIndex:i] Run:^(Test *result) {
            
            Test *test = [self.Tests objectAtIndex:i];
           // [[self.Tests objectAtIndex:i] setObject:result atIndex:i];
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
}

-(void)LogIn{
    
    /*[loginController getTokenWith : @"https://lagashsystems365.sharepoint.com" :true completionHandler:^(NSString *token) {
        testParameters = [TestParameters alloc];
        testParameters.Credentials = [[OAuthentication alloc] initWith:token];
        testParameters.ServiceUrl = @"https://lagashsystems365.sharepoint.com/sites/Argentina/Produccion/MSOpenTechLagash";
        
        testRunner = [ListTestRunner alloc];
        testRunner.Parameters = testParameters;
        
        self.Tests = [testRunner getTests];
        
        [self.tableView reloadData];
    }];*/
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    loginClient = [[LoginClient alloc] initWithParameters:[userDefaults objectForKey: @"CliendId"]
                                                         :[userDefaults objectForKey: @"RedirectUrl"]
                                                         :@"https://lagashsystems365.sharepoint.com"
                                                         :[userDefaults objectForKey: @"AuthorityUrl"]
                   ];
    		
    [loginClient login:FALSE completionHandler:^(NSString *token, NSError *error) {
        
        if(error != nil){
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Adal Error" message:error.description delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
            
            [alert show];
            
        }else{
            
            testParameters = [TestParameters alloc];
            testParameters.Credentials = [[OAuthentication alloc] initWith:token];
            testParameters.ServiceUrl = @"https://lagashsystems365.sharepoint.com/sites/Argentina/Produccion/MSOpenTechLagash";
            
            testRunner = [ListTestRunner alloc];
            testRunner.Parameters = testParameters;
            
            self.Tests = [testRunner getTests];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}
@end