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
    [self getMessagesFromInbox];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)getMessagesFromInbox{
 
    [BaseController getClient:^(MSOutlookClient *client) {
    
        [client.me readWithCallback:^(MSOutlookUser *user, NSError *error) {
            
            if (error == nil) {
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   [client.resolver.logger logMessage:@"Got results" withLevel:LOG_LEVEL_INFO];
                                   
                                   self.lblDisplayName.text = user.displayName;
                                   self.lblAlias.text = user.alias;
                                   self.lblMailBoxId.text = user.mailboxGuid;
                               });
            } else {
                [client.resolver.logger logMessage:error.description withLevel:LOG_LEVEL_ERROR];
            }
        }];
    }];
}

@end
