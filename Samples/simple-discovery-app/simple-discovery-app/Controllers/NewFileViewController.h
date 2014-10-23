/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <UIKit/UIKit.h>

@interface NewFileViewController : UIViewController

- (IBAction)CreateFile:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *txtBody;
@property (weak, nonatomic) IBOutlet UITextField *txtName;

@end