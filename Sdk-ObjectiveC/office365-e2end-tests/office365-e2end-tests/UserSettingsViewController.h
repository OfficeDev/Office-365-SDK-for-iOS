//
//  UserSettingsViewController.h
//  office365-e2end-tests
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface UserSettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtAuthorityUrl;
@property (weak, nonatomic) IBOutlet UITextField *txtRedirectUrl;
@property (weak, nonatomic) IBOutlet UITextField *txtClientId;
@property (weak, nonatomic) IBOutlet UILabel *txtLoggedInUser;

- (IBAction)Save:(id)sender;
- (IBAction)ClearCredentials:(id)sender;

@end