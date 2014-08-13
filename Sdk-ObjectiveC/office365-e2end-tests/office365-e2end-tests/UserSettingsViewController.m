//
//  UserSettingsViewController.m
//  office365-e2end-tests
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "UserSettingsViewController.h"
//#import "LogInController.h"

#import <office365-base-sdk/LoginClient.h>

@interface UserSettingsViewController ()

@end

@implementation UserSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.txtAuthorityUrl.text = [userDefaults objectForKey: @"AuthorityUrl"];
    self.txtRedirectUrl.text = [userDefaults objectForKey: @"RedirectUrl"];
    self.txtClientId.text =[userDefaults objectForKey: @"CliendId"];
    self.txtLoggedInUser.text = [userDefaults objectForKey:@"LogInUser"];
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

- (IBAction)Save:(id)sender {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.txtAuthorityUrl.text forKey:@"AuthorityUrl"];
    [userDefaults setObject:self.txtRedirectUrl.text forKey:@"RedirectUrl"];
    [userDefaults setObject:self.txtClientId.text forKey:@"CliendId"];
    [userDefaults synchronize];
}

- (IBAction)ClearCredentials:(id)sender {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"LogInUser"];
    [userDefaults synchronize];
    
    self.txtLoggedInUser.text = [userDefaults objectForKey:@"LogInUser"];
    
    NSError *error;
    LoginClient *client = [[LoginClient alloc] initWithParameters:[userDefaults objectForKey: @"CliendId"]
                                                                 :[userDefaults objectForKey: @"RedirectUrl"]
                                                                 :@"https://lagashsystems365-my.sharepoint.com"
                                                                 :[userDefaults objectForKey: @"AuthorityUrl"]
                           ];
    
    [client clearCredentials: &error];
    
    if(error != nil){
        NSString *errorMessage = [@"Clear credentials failed. Reason: " stringByAppendingString: error.description];
       // [self showOkOnlyAlert:errorMessage : @"Error"];
    }
    else
    {
     //   [self showOkOnlyAlert:@"Clear credentials success." : @"Success"];
    }
 /*   LogInController* logInController = [[LogInController alloc] init];
    
    [logInController clearCredentials];
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"LogInUser"];
    [userDefaults synchronize];
    
    self.txtLoggedInUser.text = [userDefaults objectForKey:@"LogInUser"];*/
}

@end