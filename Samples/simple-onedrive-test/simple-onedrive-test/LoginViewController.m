//
//  LoginViewController.m
//  simple-onedrive-test
//
//  Created by Lagash on 8/8/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "LoginViewController.h"
#import "FilesListController.h"
#import <office365-base-sdk/OAuthentication.h>


#import <office365-base-sdk/LoginClient.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

NSString *token;
ADAuthenticationContext* authContext;
NSString* authority;
NSString* redirectUriString;
NSString* resourceId;
NSString* clientId;
NSString* token;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    token = [NSString alloc];
    authority = [NSString alloc];
    resourceId = [NSString alloc];
    clientId = [NSString alloc];
    redirectUriString = [NSString alloc];
    
    [self performLogin:FALSE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   
}

*/

- (void) performLogin: (BOOL) clearCache {
    UIActivityIndicatorView* spinner = [self getSpinner];
    [self.view addSubview: spinner];
    [spinner startAnimating];
    
    authority = @"https://login.windows.net/common";
    resourceId = @"https://lagashsystems365-my.sharepoint.com/";
    clientId = @"a31be332-2598-42e6-97f1-d8ac87370367";
    redirectUriString = @"https://lagash.com/oauth";
    /*
     authority = @"https://login.windows.net/common";
     resourceId = @"https://lagashsystems365.sharepoint.com";//@"https://lagashsystems365-my.sharepoint.com/";
     clientId = @"778a099e-ed6e-49a2-9f15-92c01366ad7d";//@"a31be332-2598-42e6-97f1-d8ac87370367";
     redirectUriString = @"https://lagash.com/oauth";*/
    
    
    LoginClient *client = [[LoginClient alloc] initWithParameters:clientId:redirectUriString:resourceId:authority];
    [client login:clearCache completionHandler:^(NSString *t, NSError *e) {
        [spinner stopAnimating];
        if(e == nil)
        {
            token = t;
            
            FilesListController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"filesvc"];
            controller.token = t;

            [self.navigationController pushViewController:controller animated:YES];
        }
        else
        {
            NSString *errorMessage = [@"Login failed. Reason: " stringByAppendingString: e.description];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
        }
        
    }];
}


- (UIActivityIndicatorView*) getSpinner{
    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
    spinner.hidesWhenStopped = YES;
    
    return spinner;
}
- (IBAction)Clear:(id)sender {
    NSError *error;
    LoginClient *client = [[LoginClient alloc] initWithParameters: clientId: redirectUriString:resourceId :authority];
    
    [client clearCredentials: &error];
    
    if(error != nil){
        NSString *errorMessage = [@"Clear credentials failed. Reason: " stringByAppendingString: error.description];
        [self showOkOnlyAlert:errorMessage : @"Error"];
    }
    else
    {
        [self showOkOnlyAlert:@"Clear credentials success." : @"Success"];
    }
    
}

-(void) showOkOnlyAlert : (NSString*) message : (NSString*) title{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    [alert show];
}

- (IBAction)Login:(id)sender {
    [self performLogin:FALSE];
}
@end
