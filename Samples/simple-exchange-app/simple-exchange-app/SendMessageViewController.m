/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "SendMessageViewController.h"
#import "BaseController.h"
#import <office365_exchange_sdk/MSOMessage.h>
#import <office365_exchange_sdk/MSORecipient.h>
#import <office365_exchange_sdk/MSOEmailAddress.h>
#import <office365_exchange_sdk/MSOItemBody.h>
#import <office365_exchange_sdk/MSOMessageOperations.h>
#import <office365_exchange_sdk/MSOMessageFetcher.h>

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
    [BaseController getClient:^(MSOEntityContainerClient * client) {
        MSOMessage *message = [MSOMessage alloc];
        
        message.Subject = self.txtSubject.text;
        message.ToRecipients = [self getRecipients:self.txtTo.text];
        message.Body = [[MSOItemBody alloc] init];
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

-(NSMutableArray<MSORecipient>*)getRecipients : (NSString*)text{
    
    NSMutableArray<MSORecipient>* result = (NSMutableArray<MSORecipient>*)[NSMutableArray array];
    
    NSArray* recipients = [text componentsSeparatedByString:@","];
    
    for (NSString* r in recipients) {
        
        MSORecipient* recipient = [[MSORecipient alloc] init];
        recipient.EmailAddress = [MSOEmailAddress alloc];
        recipient.EmailAddress.Address = [r stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        [result addObject: recipient];
    }
    return result;
}

@end