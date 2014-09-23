//
//  MessageTableViewController.m
//  simple-exchange-app
//
//  Created by Gustavo on 8/21/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "MessageTableViewController.h"
#import "LoginClient.h"
#import <office365-exchange-sdk/OAuthCredentials.h>
#import <office365-exchange-sdk/Message.h>
#import <office365-exchange-sdk/ItemBody.h>
#import <office365-exchange-sdk/EntityContainer.h>
#import <office365-exchange-sdk/NSURLSessionODataTask.h>


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
    
    authority = @"https://login.windows-ppe.net/common";
    resourceId = @"https://sdfpilot.outlook.com";//@"https://graph.windows.net";///lagashsystems";//
    clientId = @"2662c14f-d33d-4249-bbde-84fad173b865";
    redirectUriString = @"https://ios365";
 
    self.LoginClient = [[LoginClient alloc] initWithParameters: clientId
                                                         :redirectUriString
                                                         :resourceId
                                                         :authority];
    
   // [self.LoginClient clearCredentials:nil];
    [self.LoginClient login:false completionHandler:^(NSString *token, NSError *error) {
        
        if(error != nil){
            
            //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Adal Error" message:error.description delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
            
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
    
    NSString *url = @"https://sdfpilot.outlook.com/EWS/OData";
    OAuthCredentials * credentials = [[OAuthCredentials alloc] initWith:self.Token];
    
     container= [EntityContainer initializeEntityContainer:url credentials:credentials];
    
}

-(void)getMessages{
 
    NSURLSessionODataTask* task = [container getMessages:@"Inbox"];
    
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