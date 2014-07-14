//
//  AddContactViewController.h
//  test-app
//
//  Created by Gustavo on 7/14/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddContactViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *ContactName;
@property (weak, nonatomic) IBOutlet UITextField *ContactLastName;
@property (weak, nonatomic) IBOutlet UITextField *ContactCellPhone;
@property (weak, nonatomic) IBOutlet UITextField *ContactEmail;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *SaveButton;

@end