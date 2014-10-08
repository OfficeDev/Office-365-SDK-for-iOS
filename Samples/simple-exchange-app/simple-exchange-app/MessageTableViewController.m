//
//  MessageTableViewController.m
//  simple-exchange-app
//
//  Created by Gustavo on 8/21/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "MessageTableViewController.h"
#import <office365_exchange_sdk/EntityContainerClient.h>
#import <office365_odata_impl/DefaultDependencyResolver.h>
#import <office365_odata_impl/BasicCredentials.h>
#import <office365_odata_impl/CredentialsImpl.h>
#import <office365_exchange_sdk/Recipient.h>
#import <office365_exchange_sdk/EmailAddress.h>

@interface MessageTableViewController ()

@property NSString *Token;
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
    [self getMessagesFromInbox];
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
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@",message.Sender.EmailAddress.Name, message.Subject];//message.Subject;
    
    return cell;
}

-(void)getMessagesFromInbox{
 
    DefaultDependencyResolver* resolver = [DefaultDependencyResolver alloc];
    BasicCredentials* credentials = [BasicCredentials alloc];
    [credentials addToken:@"di1ndWhhbnNAbXNvcGVudGVjaC5jY3NjdHAubmV0OkFEQ0dhaDE0ODc="];
    
    CredentialsImpl* credentialsImpl = [CredentialsImpl alloc];
    [credentialsImpl setCredentials:credentials];
    [resolver setCredentialsFactory:credentialsImpl];
    
    EntityContainerClient* client = [[EntityContainerClient alloc] initWit:@"https://sdfpilot.outlook.com/ews/odata" : resolver];
    
    NSURLSessionTask* task = [[[client getMe] getMessages] execute:^(id messages, NSURLResponse *r, NSError *e) {
        if(e == nil){
            self.Messages = (NSArray<Message>*)messages;
            [self.tableView reloadData];
        }
    }];
    
     /* NSURLSessionTask* task =[[[[[client getMe] getFolders] getById:@"Inbox"] getMessages] execute:^(id messages, NSURLResponse * r, NSError * e) {
        
        if(e != nil){
            self.Messages = (NSArray<Message>*)messages;
            [self.tableView reloadData];
        }
    }];*/
    
    [task resume];
    /*
    NSURLSessionTask* task1 = [[[client getMe] getFolders] execute:^(id a, NSURLResponse *r, NSError *e) {
        if(e != nil){
           // self.Messages = (NSArray<Message>*)a;
            [self.tableView reloadData];
        }
    }];
    
    [task1 resume];
    
    NSURLSessionTask* task2 = [[[[client getMe] getFolders] getById:@"Inbox"] execute:^(id a, NSURLResponse *r, NSError *e) {
        if(e != nil){
            // self.Messages = (NSArray<Message>*)a;
            [self.tableView reloadData];
        }
    }];
    
    [task2 resume];
    
    [[[[[[client getMe] getFolders] getById:@"Inbox"] getMessages] execute:^(id messages, NSURLResponse * r, NSError * e) {
        
        if(e != nil){
             self.Messages = (NSArray<Message>*)messages;
               [self.tableView reloadData];
        }
    }] resume];
     */
}

- (IBAction)unwindExchangeViews:(UIStoryboardSegue *)segue{
    
}

@end