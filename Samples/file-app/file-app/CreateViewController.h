//
//  CreateViewController.h
//  file-app
//
//  Created by Lagash on 6/24/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateViewController : UIViewController

- (IBAction)CreateFile:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *FileNameTxt;
@property (weak, nonatomic) IBOutlet UITextView *ContentText;
@property NSString* token;

@end
