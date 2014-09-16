//
//  MessageTableViewController.m
//  simple-exchange-app
//
//  Created by Gustavo on 8/21/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "MessageTableViewController.h"
#import "LoginClient.h"
#import <office365-exchange-sdk/OAuthentication.h>
#import <office365-exchange-sdk/Message.h>
#import <office365-exchange-sdk/ItemBody.h>
#import <office365-exchange-sdk/EntityContainer.h>
#import <office365-exchange-sdk/NSURLSessionDataTaskOdata.h>


@interface MessageTableViewController ()
@property NSString *Token;
@property LoginClient * LoginClient;
@property NSArray *Messages;
@end

@implementation MessageTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self logIn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.Messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    
    Message *message = (Message*)[self.Messages objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@",message.Subject, message.Body.ContentType];//message.Subject;
    
    return cell;
}

NSString *token;
ADAuthenticationContext* authContext;
NSString* authority;
NSString* redirectUriString;
NSString* resourceId;
NSString* clientId;
NSString* token;

-(void)logIn{
    
    authority = @"https://login.windows.net/common";
    resourceId = @"https://outlook.office365.com";//@"https://graph.windows.net";///lagashsystems";//
    clientId = @"a31be332-2598-42e6-97f1-d8ac87370367";
    redirectUriString = @"https://lagash.com/oauth";
 
    self.LoginClient = [[LoginClient alloc] initWithParameters: clientId
                                                         :redirectUriString
                                                         :resourceId
                                                         :authority];
    
   // [self.LoginClient clearCredentials:nil];
    [self.LoginClient login:false completionHandler:^(NSString *token, NSError *error) {
        
        if(error != nil){
            
            //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Adal Error" message:error.description delegate:nil canchttps://outlook.office365.com/EWS/OData/MeelButtonTitle:@"Cancel" otherButtonTitles: nil];
            
           // [alert show];
            
        }else{
            
            self.Token = token;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self initContainer];
                [self getMessages];
               // [self.tableView reloadData];
            });
        }
    }];
}
EntityContainer *container;
-(void)initContainer{
    
    NSString *url = @"https://outlook.office365.com/EWS/OData/Me";
    OAuthentication * credentials = [[OAuthentication alloc] initWith:self.Token];
    
     container= [EntityContainer initializeEntityContainer:url credentials:credentials];//[EntityContaine
    
}

-(void)getMessages{
 
    NSURLSessionDataTaskOdata* task = [container getMessages:@"Inbox" : [Message class]];
    
    [[task top:10] select:@"Id,Subject,Body"];
    
    [task execute:^(id data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.Messages = (NSArray<Message>*)data;
            
            [self.tableView reloadData];
        
        });
    }];
}

- (IBAction)unwindExchangeViews:(UIStoryboardSegue *)segue{
    
}

@end