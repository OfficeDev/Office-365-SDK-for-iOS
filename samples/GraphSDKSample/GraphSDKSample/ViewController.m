//
//  ViewController.m
//  GraphSDKSample
//
//  Created by Miguel Ángel Pérez Martínez on 12/2/15.
//  Copyright © 2015 Miguel Ángel Pérez Martínez. All rights reserved.
//

#import "ViewController.h"

@interface MailEntry: NSObject
@property bool toggle;
@property MSGraphServiceMessage *message;
@end

@implementation MailEntry
- (instancetype) initWithMessage: (MSGraphServiceMessage *) message  {
    if(self=[super init])
    {
        _message=message;
        _toggle=false;
    }
    return self;
}
@end


@interface SimpleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISwitch *Switch;
@property (weak, nonatomic) IBOutlet UILabel *Label;

@end

@implementation SimpleCell

@end

@interface ViewController ()

@property MSGraphServiceMailFolder *inbox;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *mailList;
@end

@implementation ViewController


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.mailList count];
}

- (UIFont *) boldizeFont: (UIFont *)font to: (bool) bold {
    UIFontDescriptor * fontD = [font.fontDescriptor
                                fontDescriptorWithSymbolicTraits:(bold?UIFontDescriptorTraitBold:0)];
    return [UIFont fontWithDescriptor:fontD size:0];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleCell"];
    
    MailEntry *mailEntry = self.mailList[indexPath.row];
    
    cell.Label.text = mailEntry.message.subject;
    
    cell.Label.font = [self boldizeFont: cell.Label.font to: !mailEntry.message.isRead];
    
    cell.Switch.on  = mailEntry.toggle;
    
    cell.Switch.tag = indexPath.row;
    
    [cell.Switch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged ];
    
    return cell;
}

- (void) switchChanged:(id)sender {
    UISwitch* switchControl = sender;
    MailEntry *mailEntry = self.mailList[switchControl.tag];
    mailEntry.toggle=switchControl.on;
}



- (void) flagMessagesAsRead: (bool) read {
    __weak typeof(self) weakSelf = self;
    if(self.updateCount!=0) return;
    
    
    
    for ( MailEntry *mailEntry in self.mailList ) {
        if(mailEntry.toggle) {
            self.updateCount++;
            
            /*
             * For each mail flagged for update, and the desired target state,
             * we modify the previously fetched messages and send an update request
             */
            
            mailEntry.message.isRead=read;
            
            [[self.graphClient.me.messages getById:mailEntry.message._id] update:mailEntry.message callback:^(MSGraphServiceMessage *updatedMessage, MSOrcError *error) {
                
                weakSelf.updateCount--;
                if(weakSelf.updateCount==0)
                {
                    [self.tableView reloadData];
                }
            }];
        }
    }
    

    
}

- (IBAction)markAsRead:(id)sender {
    [self flagMessagesAsRead:true];
}

- (IBAction)markAsUnread:(id)sender {
    [self flagMessagesAsRead:false];
}

- (IBAction)selectAll:(id)sender {
    
    /*
     * Sets all mail update toggles to true;
     */
    for ( MailEntry *mailEntry in self.mailList ) {
        mailEntry.toggle=true;
    }
    
    [self.tableView reloadData];
}


- (void) updateMailsList {
    __weak typeof(self) weakSelf = self;
    
    /* 
     * Gets the 20 first messages from the inbox, loads them in an array
     * and reloads the table view
     */
    
    [[[self.graphClient.me.mailFolders getById:self.inbox._id ].messages top:20] readWithCallback:^(NSArray *messages, MSOrcError *error) {
        
        if(error==nil)
        {
            weakSelf.mailList=[[NSMutableArray alloc]init];
            
            for ( MSGraphServiceMessage *message in messages ) {
                [weakSelf.mailList addObject:[[MailEntry alloc] initWithMessage:message]];
            }

            [weakSelf.tableView reloadData];
        }
        else [self.resolver.logger logMessage:@"Fetch messages failed." withLevel:LOG_LEVEL_ERROR];
    }];
};

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    
    self.updateCount=0;
    
    /*
     * Creates an ADAL auth resolver with settings loaded from 
     * adal_settings.plist
     */
    self.resolver = [[ADALDependencyResolver alloc] initWithPlist];
    
    /*
     * Creates an MSGraph client setting the url for the endpoint, and using the previusly
     * created ADAL auth resolver 
     */
    self.graphClient = [[MSGraphServiceClient alloc] initWithUrl:@"https://graph.microsoft.com/v1.0" dependencyResolver:self.resolver];

    /*
     * Initiates async ADAL interactive logon (Requests credentials from the user)
     */
    [self.resolver interactiveLogonWithCallback:^(ADAuthenticationResult *result) {
        if (result.status == AD_SUCCEEDED) {
            
            /*
             * Gets the mailfolder "Inbox" from "me" via the graph client.
             */
            [[self.graphClient.me.mailFolders getById:@"Inbox"] readWithCallback:^(MSGraphServiceMailFolder *folder, MSOrcError *error) {
                
                if(error!=nil) {
                    [weakSelf.resolver.logger logMessage:[error localizedDescription] withLevel:LOG_LEVEL_ERROR];
                }
                
                /*
                 * If not null, saves the inbox folder for later operations
                 */
                if (folder != nil) {
                    weakSelf.inbox=folder;
                    [weakSelf updateMailsList];
                }
            }];
            
        } else {
            [self.resolver.logger logMessage:@"Authentication failed." withLevel:LOG_LEVEL_ERROR];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
