/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "MessageTableViewController.h"
#import "BaseController.h"
#import <office365_exchange_sdk/MSORecipient.h>
#import <office365_exchange_sdk/MSOEmailAddress.h>
#import <office365_exchange_sdk/MSOMessage.h>
#import <office365_exchange_sdk/MSOUserFetcher.h>
#import <office365_exchange_sdk/MSOMessageCollectionFetcher.h>

@interface MessageTableViewController ()

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
    
    MSOMessage *message = (MSOMessage*)[self.Messages objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@" ,message.Sender.EmailAddress.Name, message.Subject];
    
    return cell;
}

-(void)getMessagesFromInbox{
 
    MSOEntityContainerClient* client = [[BaseController alloc] getClient];
   
    /*NSURLSessionTask* task = [[client getMe] execute:^(User *user, NSError *error) {
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           self.Messages = [[NSArray alloc] initWithObjects:user, nil];
                           [self.tableView reloadData];
                       });
    }];*/
    //[[client getMe] :^(id folders, NSURLResponse *r, NSError *e) {
        /*if(e == nil){
            self.Messages = [[NSArray alloc] initWithObjects:folders, nil];// (NSArray<User>*)folders;
            [self.tableView reloadData];
        }
    }];*/
    
    NSURLSessionTask* task = [[[client getMe] getMessages] execute:^(NSArray<MSOMessage> *messages, NSError *error) {
        if(error == nil){
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                               self.Messages = messages;
                               [self.tableView reloadData];
                           });
        }
    }];

    [task resume];
}

- (IBAction)unwindExchangeViews:(UIStoryboardSegue *)segue{
    
}

@end