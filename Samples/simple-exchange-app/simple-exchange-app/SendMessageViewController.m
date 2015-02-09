//
//  SendMessageViewController.m
//  simple-exchange-app
//
//  Created by Gustavo on 10/9/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "SendMessageViewController.h"
#import "BaseController.h"
#import <office365_exchange_sdk/office365_exchange_sdk.h>

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SendMail:(id)sender{

    [BaseController getClient:^(MSOutlookClient * client) {
        MSOutlookMessage *message = [MSOutlookMessage alloc];
        
        message.Subject = self.txtSubject.text;
        message.ToRecipients = [self getRecipients:self.txtTo.text];
        message.Body = [[MSOutlookItemBody alloc] init];
        message.Body.Content = self.txtBody.text;
        
        NSURLSessionDataTask* task = [[[client getMe] getOperations]sendMail:message :true :^(int returnValue, MSODataException *error) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Message sent!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [alert show];
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
