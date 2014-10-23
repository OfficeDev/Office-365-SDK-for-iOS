/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <UIKit/UIKit.h>

@interface SendMessageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtTo;
@property (weak, nonatomic) IBOutlet UITextField *txtSubject;
@property (weak, nonatomic) IBOutlet UITextView *txtBody;

@end