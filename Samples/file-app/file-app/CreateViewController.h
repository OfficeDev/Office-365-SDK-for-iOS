//
//  CreateViewController.h
//  file-app
//
//  Created by Lagash on 6/24/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <office365_base_sdk/office365_base_sdk-Swift.h>
#import <office365_files_sdk/office365_files_sdk-Swift.h>

@interface CreateViewController : UIViewController

- (IBAction)CreateFile:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *FileNameTxt;
@property (weak, nonatomic) IBOutlet UITextView *ContentText;
@property NSString* token;

@end
