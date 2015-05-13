/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "MessageTableViewController.h"
#import "BaseController.h"
#import <office365_exchange_sdk/office365_exchange_sdk.h>

@interface MessageTableViewController ()

@property NSArray *Messages;
@property MSOutlookClient* client;

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
    
    [BaseController getClient:^(MSOutlookClient *client) {
        self.client = client;
        [self getMessagesFromInbox];
    }];
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
    
    MSOutlookMessage *message = (MSOutlookMessage*)[self.Messages objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@" ,message.sender.emailAddress.name, message.Subject];
    
    return cell;
}

-(void)getMessagesFromInbox{
    
    [self.client.me.messages readWithCallback:^(NSArray<MSOutlookMessage> *messages, MSOrcError *error) {
        
        if(error == nil){
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                               self.Messages = messages;
                               [self.tableView reloadData];
                           });
        }
    }];
}

- (IBAction)unwindExchangeViews:(UIStoryboardSegue *)segue{
    
}

@end