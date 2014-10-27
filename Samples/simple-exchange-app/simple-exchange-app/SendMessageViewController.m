/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "SendMessageViewController.h"
#import "BaseController.h"

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
        MSOutlookMessage *message = [MSOutlookMessage alloc];
        
        message.Subject = self.txtSubject.text;
        message.ToRecipients = [self getRecipients:self.txtTo.text];
        message.Body = [[MSOutlookItemBody alloc] init];
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

-(NSMutableArray<MSOutlookRecipient>*)getRecipients : (NSString*)text{
    
    NSMutableArray<MSOutlookRecipient>* result = (NSMutableArray<MSOutlookRecipient>*)[NSMutableArray array];
    
    NSArray* recipients = [text componentsSeparatedByString:@","];
    
    for (NSString* r in recipients) {
        
        MSOutlookRecipient* recipient = [[MSOutlookRecipient alloc] init];
        recipient.EmailAddress = [MSOutlookEmailAddress alloc];
        recipient.EmailAddress.Address = [r stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        [result addObject: recipient];
    }
    return result;
}

@end