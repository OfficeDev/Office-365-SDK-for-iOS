/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "SendMessageViewController.h"
#import "BaseController.h"
#import <office365_exchange_sdk/MSMessage.h>
#import <office365_exchange_sdk/MSRecipient.h>
#import <office365_exchange_sdk/MSEmailAddress.h>
#import <office365_exchange_sdk/MSItemBody.h>
#import <office365_exchange_sdk/MSMessageOperations.h>
#import <office365_exchange_sdk/MSMessageFetcher.h>

@interface SendMessageViewController ()

@end

@implementation SendMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SendMail:(id)sender{

    UIActivityIndicatorView *spinner = [BaseController getSpinner:self.view];
    [BaseController getClient:^(MSOutlookClient * client) {
        MSMessage *message = [MSMessage alloc];
        
        message.Subject = self.txtSubject.text;
        message.ToRecipients = [self getRecipients:self.txtTo.text];
        message.Body = [[MSItemBody alloc] init];
        message.Body.Content = self.txtBody.text;
        
        NSURLSessionDataTask* task = [[[client getMe] getOperations]sendMail:message :true :^(int returnValue, NSError *error) {
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                message:@"Message sent!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
                                [spinner stopAnimating];
                                [alert show];
                           });
        }];
        
        [task resume];
    }];
}

-(NSMutableArray<MSRecipient>*)getRecipients : (NSString*)text{
    
    NSMutableArray<MSRecipient>* result = (NSMutableArray<MSRecipient>*)[NSMutableArray array];
    
    NSArray* recipients = [text componentsSeparatedByString:@","];
    
    for (NSString* r in recipients) {
        
        MSRecipient* recipient = [[MSRecipient alloc] init];
        recipient.EmailAddress = [MSEmailAddress alloc];
        recipient.EmailAddress.Address = [r stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        [result addObject: recipient];
    }
    return result;
}

@end