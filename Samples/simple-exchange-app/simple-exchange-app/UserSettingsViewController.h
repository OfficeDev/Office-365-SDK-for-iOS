//
//  UserSettingsViewController.h
//  office365-e2end-tests
//
//  Created by Gustavo on 7/29/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserSettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtAuthorityUrl;
@property (weak, nonatomic) IBOutlet UITextField *txtRedirectUrl;
@property (weak, nonatomic) IBOutlet UITextField *txtClientId;
@property (weak, nonatomic) IBOutlet UILabel *txtLoggedInUser;

- (IBAction)Save:(id)sender;
- (IBAction)ClearCredentials:(id)sender;

@end