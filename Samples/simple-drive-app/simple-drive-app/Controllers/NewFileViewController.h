//
//  NewFileViewController.h
//  simple-drive-app
//
//  Created by Gustavo on 10/22/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewFileViewController : UIViewController
- (IBAction)CreateFile:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *txtBody;

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@end
