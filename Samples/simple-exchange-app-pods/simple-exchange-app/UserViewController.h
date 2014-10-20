/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblDisplayName;
@property (weak, nonatomic) IBOutlet UILabel *lblAlias;
@property (weak, nonatomic) IBOutlet UILabel *lblMailBoxId;

@end
