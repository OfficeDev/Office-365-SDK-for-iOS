//
//  SendMessageViewController.h
//  simple-exchange-app
//
//  Created by Gustavo on 10/9/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendMessageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtTo;
@property (weak, nonatomic) IBOutlet UITextField *txtSubject;
@property (weak, nonatomic) IBOutlet UITextView *txtBody;

@end
