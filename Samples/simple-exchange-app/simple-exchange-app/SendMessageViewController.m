//
//  SendMessageViewController.m
//  simple-exchange-app
//
//  Created by Gustavo on 10/9/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "SendMessageViewController.h"
#import "BaseController.h"
#import <office365_exchange_sdk/Message.h>
#import <office365_exchange_sdk/Recipient.h>
#import <office365_exchange_sdk/EmailAddress.h>
#import <office365_exchange_sdk/ItemBody.h>
#import <office365_exchange_sdk/MessageOperations.h>
#import <office365_exchange_sdk/MessageFetcher.h>

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

    EntityContainerClient* client = [[BaseController alloc] getClient];
    Message *message = [Message alloc];
    
    message.Subject = self.txtSubject.text;
    message.ToRecipients = [self getRecipients:self.txtTo.text];
    message.Body = [[ItemBody alloc] init];
    message.Body.Content = self.txtBody.text;
    
    NSURLSessionDataTask* task = [[[client getMe] getMessages] add:message :^(Message* r, NSError *e) {
        if (e == nil) {
            MessageFetcher* m = [[[client getMe] getMessages] getById:r.Id];
            MessageOperations* mf = [m getOperations];
            
           NSURLSessionDataTask* task = [mf sendMail:^(int returnValue, NSError *error) {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Message sent!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                
                [alert show];
            }];
            
            [task resume];
            
        }
    }];
    [task resume];
}

-(NSMutableArray<Recipient>*)getRecipients : (NSString*)text{
    
    NSMutableArray<Recipient>* result = (NSMutableArray<Recipient>*)[NSMutableArray array];
    
    NSArray* recipients = [text componentsSeparatedByString:@","];
    
    for (NSString* r in recipients) {
        
        Recipient* recipient = [[Recipient alloc] init];
        recipient.EmailAddress = [EmailAddress alloc];
        recipient.EmailAddress.Address = [r stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        [result addObject: recipient];
    }
    return result;
}
@end
