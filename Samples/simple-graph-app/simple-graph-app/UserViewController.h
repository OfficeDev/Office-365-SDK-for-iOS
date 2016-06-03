/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pkrUsers;

@property (weak, nonatomic) IBOutlet UITextField *displayName;
@property (weak, nonatomic) IBOutlet UITextField *uPN;
@property (weak, nonatomic) IBOutlet UITextField *userType;
@property (weak, nonatomic) IBOutlet UITextField *mailNickname;
@property (weak, nonatomic) IBOutlet UITextField *objectId;

@end
