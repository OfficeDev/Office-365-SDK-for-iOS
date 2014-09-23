//
//  NewMessageViewController.m
//  simple-exchange-app
//
//  Created by Gustavo on 9/15/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "NewMessageViewController.h"
#import <office365-exchange-sdk/Message.h>
#import <office365-exchange-sdk/Recipient.h>
#import <office365-exchange-sdk/ItemBody.h>
#import <office365-exchange-sdk/EntityContainer.h>

@implementation NewMessageViewController

- (IBAction)SendMail:(id)sender {
    
    Message* message = [Message alloc] ;
    message.Subject = self.txtSubject.text;
    message.Body = [[ItemBody alloc] init];
    message.Body.Content = self.txtBody.text;
    message.ToRecipients = [self getRecipients:self.txtTo.text];
    message.CcRecipients = [self getRecipients:self.txtCc.text];
    message.IsDraft = true;
    EntityContainer* container = [EntityContainer getEntityContainer];
    
    [[container createMessage:message Path:@"Inbox" Callback:^(Message *message, NSURLResponse *response, NSError *error) {
        if(error == nil){
            [[[message getOperations] Send:^(int returnValue, NSURLResponse *response, NSError *error)  {
                
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Message sent!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                
                [alert show];
                
            }] resume];
        }
        
    }] resume];
}


-(NSMutableArray<Recipient>*)getRecipients : (NSString*)text{

    NSMutableArray<Recipient>* result = (NSMutableArray<Recipient>*)[NSMutableArray array];
    
    NSArray* recipients = [text componentsSeparatedByString:@","];
    
    for (NSString* r in recipients) {
        
        Recipient* recipient = [[Recipient alloc] init];
        recipient.Address = r;
        
        [result addObject: recipient];
    }
    return result;
}
@end