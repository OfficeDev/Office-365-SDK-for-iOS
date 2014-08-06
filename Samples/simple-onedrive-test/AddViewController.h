//
//  AddViewController.h
//  simple-onedrive-test
//
//  Created by Gustavo on 8/6/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
- (IBAction)addItem:(id)sender;
@property NSMutableArray *files;
@property (weak, nonatomic) IBOutlet UITextField *fileTxt;
@property (weak, nonatomic) IBOutlet UITextView *fileContent;
@property NSString* token;
@end
