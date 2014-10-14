//
//  SendMessageViewController.m
//  simple-exchange-app
//
//  Created by Gustavo on 10/9/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SendMail:(id)sender{

    MSOEntityContainerClient* client = [[BaseController alloc] getClient];
    MSOMessage *message = [MSOMessage alloc];
    
    message.Subject = self.txtSubject.text;
    message.ToRecipients = [self getRecipients:self.txtTo.text];
    message.Body = [[MSOItemBody alloc] init];
    message.Body.Content = self.txtBody.text;
    /*
    NSURLSessionDataTask* task = [[[client getMe] getMessages] add:message :^(MSOMessage* r, NSError *e) {
        if (e == nil) {
            MSOMessageFetcher* m = [[[client getMe] getMessages] getById:r.Id];
            MSOMessageOperations* mf = [m getOperations];
            
          NSURLSessionDataTask* task = [mf sendMail:^(int returnValue, NSError *error) {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Message sent!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                
                [alert show];
            }];
        
            [task resume];
            
        }
    }];
    [task resume];*/
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
