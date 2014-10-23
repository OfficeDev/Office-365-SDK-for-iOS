/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "UserViewController.h"
#import "BaseController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getUserData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)getUserData{

    UIActivityIndicatorView* spinner = [BaseController getSpinner:self.view];
    [BaseController getClient:^(MSOutlookClient * client) {
        NSURLSessionTask* task = [[client getMe] execute:^(MSUser *user, NSError *error) {
            if(error == nil){
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   self.lblDisplayName.text = user.DisplayName;
                                   self.lblAlias.text = user.Alias;
                                   self.lblMailBoxId.text = user.MailboxGuid;
                                   [spinner stopAnimating];
                               });
            }
        }];
        
        [task resume];
    }];
}

@end