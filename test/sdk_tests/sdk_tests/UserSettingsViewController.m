/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "UserSettingsViewController.h"
#import "AuthenticationController.h"

@interface UserSettingsViewController ()

@end

@implementation UserSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
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
    self.txtTestMail.text = [userDefaults objectForKey:@"TestMail"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)Save:(id)sender {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.txtAuthorityUrl.text forKey:@"AuthorityUrl"];
    [userDefaults setObject:self.txtRedirectUrl.text forKey:@"RedirectUrl"];
    [userDefaults setObject:self.txtClientId.text forKey:@"CliendId"];
    [userDefaults setObject:self.txtTestMail.text forKey:@"TestMail"];
    [userDefaults synchronize];
}

- (IBAction)ClearCredentials:(id)sender {
    
    [[AuthenticationController getInstance] clearCredentials];
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"LogInUser"];
    [userDefaults synchronize];
    
    self.txtLoggedInUser.text = [userDefaults objectForKey:@"LogInUser"];
}

@end