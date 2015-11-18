/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "SDKListTableViewController.h"
#import "BaseController.h"
#import "AuthenticationController.h"

@implementation SDKListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.availableSdks = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)loadInitialData {
    
    [self.availableSdks addObject:@"Exchange"];
    [self.availableSdks addObject:@"Files"];
    [self.availableSdks addObject:@"Discovery"];
    [self.availableSdks addObject:@"OneNote"];
    [self.availableSdks addObject:@"MSGraph"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.availableSdks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    NSString *sdkName= [self.availableSdks objectAtIndex:indexPath.row];
    cell.textLabel.text = sdkName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *name = [self.availableSdks objectAtIndex:indexPath.row];
    BaseController *baseController = [[BaseController alloc]init];
    
    if ([name isEqualToString:@"Exchange"]) {
        
        [[[BaseController alloc]init]getMailClient:^(MSOutlookClient *c) {
            MailTestRunner *runner = [[MailTestRunner alloc] initWithClient:c];
            [self performSegueWithIdentifier:@"segue" sender:runner];
        }];
    }
    
    /*
    if ([name isEqualToString:@"Files"]) {
        
        [[[BaseController alloc]init]getFilesClient:^(MSFilesClient *c) {
            FilesTestRunner *runner = [[FilesTestRunner alloc] initWithClient:c];
            [self performSegueWithIdentifier:@"segue" sender:runner];
        }];
    }
    */
    
    if ([name isEqualToString:@"Discovery"]) {
        
        [[[BaseController alloc]init]getDiscoveryClient:^(MSDiscoveryClient *c) {
            DiscoveryTestRunner *runner = [[DiscoveryTestRunner alloc] initWithClient:c];
            [self performSegueWithIdentifier:@"segue" sender:runner];
        }];
    }
    
    if ([name isEqualToString:@"OneNote"]) {
        [baseController getOneNoteClient: self :^(MSOneNoteApiClient *c) {
            
            if (c!= nil) {
                
                OneNoteTestRunner *runner = [[OneNoteTestRunner alloc] initWithClient:c];
                [self performSegueWithIdentifier:@"segue" sender:runner];
            }
            else {
                
                AuthenticationController *authenticationController = [AuthenticationController getInstance];
                [authenticationController authenticateWithLiveSDK:self :^(LiveConnectSession *session) {
                    
                    if(session != nil){
                        
                        OneNoteTestRunner *runner = [[OneNoteTestRunner alloc] initWithClient:[baseController getOneNoteClient:session != nil]];
                        [self performSegueWithIdentifier:@"segue" sender:runner];
                    }
                    else {
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Live SDK"
                                                                        message:@"Could not login!" delegate:self cancelButtonTitle:@"Ok"
                                                              otherButtonTitles:nil];
                        [alert show];
                    }
                }];
            }
        }];
    }
    
    if ([name isEqualToString:@"MSGraph"]) {
        
        [[[BaseController alloc] init] getMSGraphClient:^(MSGraphServiceClient *c) {
            
            MSGraphTestRunner *runner = [[MSGraphTestRunner alloc] initWithClient:c];
            [self performSegueWithIdentifier:@"segue" sender:runner];
        }];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"segue"]) {
        
        TestRunnerTableViewController *vc =  segue.destinationViewController;
        vc.TestRunner = (BaseTestRunner *)sender;
    }
}

- (void) authCompleted: (LiveConnectSessionStatus) status
               session: (LiveConnectSession *) session
             userState: (id) userState
{
   /* UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Live SDK"
                                                    message:@"You're now logged in. Please select the sdk again." delegate:self cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];*/
}

@end
