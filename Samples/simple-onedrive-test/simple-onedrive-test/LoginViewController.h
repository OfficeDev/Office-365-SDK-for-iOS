//
//  LoginViewController.h
//  simple-onedrive-test
//
//  Created by Lagash on 8/8/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UIAlertViewDelegate>
- (IBAction)login:(UIButton *)sender;
- (IBAction)clear:(UIButton *)sender;

@end
