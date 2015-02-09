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
    
   // MSOEntityContainerClient* client = [[BaseController alloc] getClient];
 
    [BaseController getClient:^(MSOutlookClient * client) {
        NSURLSessionTask* task = [[client getMe] read:^(MSOutlookUser *user, NSError *error) {
            if(error == nil){
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   [[[client getResolver] getLogger]log:@"Got results" :(MSODataLogLevel *)INFO];
                                   
                                   self.lblDisplayName.text = user.DisplayName;
                                   self.lblAlias.text = user.Alias;
                                   self.lblMailBoxId.text = user.MailboxGuid;
                               });
            }
        }];
        
        [task resume];
    }];
}

@end
