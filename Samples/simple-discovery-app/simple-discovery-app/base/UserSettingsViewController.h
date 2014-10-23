/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

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