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
    if ([userDefaults stringForKey:@"AuthorityUrl"] == nil) {
        [userDefaults setObject:@"https://login.windows.net/common" forKey:@"AuthorityUrl"];
    }
    self.txtAuthorityUrl.text = [userDefaults stringForKey: @"AuthorityUrl"];
    self.txtRedirectUrl.text = [userDefaults stringForKey: @"RedirectUrl"];
    self.txtClientId.text =[userDefaults stringForKey: @"ClientId"];
    self.txtLoggedInUser.text = [userDefaults stringForKey:@"LoggedInUser"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction) Save:(id)sender {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.txtAuthorityUrl.text forKey:@"AuthorityUrl"];
    [userDefaults setObject:self.txtRedirectUrl.text forKey:@"RedirectUrl"];
    [userDefaults setObject:self.txtClientId.text forKey:@"ClientId"];
    [userDefaults synchronize];
}

- (IBAction)ClearCredentials:(id)sender {
    
    [[AuthenticationController getInstance] clearCredentials];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"AuthorityUrl"];
    [userDefaults removeObjectForKey:@"RedirectUrl"];
    [userDefaults removeObjectForKey:@"ClientId"];
    [userDefaults removeObjectForKey:@"LoggedInUser"];
    [userDefaults synchronize];
    
    self.txtLoggedInUser.text = @"";
    self.txtAuthorityUrl.text = @"";
    self.txtRedirectUrl.text = @"";
    self.txtClientId.text = @"";
}

@end