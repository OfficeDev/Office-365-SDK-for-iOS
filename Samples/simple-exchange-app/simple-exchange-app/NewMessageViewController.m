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

UIActivityIndicatorView* spinner;

-(void)getSpinner{
    int width = self.view.frame.size.width;
    int height = self.view.frame.size.height;
    spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0,0,width,height)];
    spinner.hidesWhenStopped = YES;
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
    [self.view addSubview:spinner];
}

- (IBAction)SendMail:(id)sender {
    [self getSpinner];
    [spinner startAnimating];
    Message* message = [Message alloc] ;
    message.Subject = self.txtSubject.text;
    message.Body = [[ItemBody alloc] init];
    message.Body.Content = self.txtBody.text;
    message.ToRecipients = [self getRecipients:self.txtTo.text];
    message.IsDraft = true;
    EntityContainer* container = [EntityContainer getEntityContainer];
    
    __block UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Message sent!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [[container createMessage:message Path:@"Inbox" Callback:^(Message *message, NSURLResponse *response, NSError *error) {
        if(error == nil){
            [[[message getOperations] Send:^(int returnValue, NSURLResponse *response, NSError *error)  {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [spinner stopAnimating];
                    [alert show];
                });
                
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end