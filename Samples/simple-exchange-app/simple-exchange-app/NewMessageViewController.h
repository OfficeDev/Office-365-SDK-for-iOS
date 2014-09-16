//
//  NewMessageViewController.h
//  simple-exchange-app
//
//  Created by Gustavo on 9/15/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewMessageViewController : UIViewController
- (IBAction)SendMail:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtTo;
@property (weak, nonatomic) IBOutlet UITextField *txtCc;
@property (weak, nonatomic) IBOutlet UITextField *txtSubject;
@property (weak, nonatomic) IBOutlet UITextView *txtBody;

@end
