//
//  SDKListTableViewController.m
//  office365-e2end-tests
//
//  Created by Anahi Hojnadel on 11/13/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "SDKListTableViewController.h"

@implementation SDKListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.availableSdks = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)loadInitialData {
    [self.availableSdks addObject:@"Exchange"];
    [self.availableSdks addObject:@"Files"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.availableSdks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    NSString *sdkName= [self.availableSdks objectAtIndex:indexPath.row];
    cell.textLabel.text = sdkName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *name = [self.availableSdks objectAtIndex:indexPath.row];
    
    
    if([name isEqualToString:@"Exchange"]){
        [[[BaseController alloc]init]getMailClient:^(MSOutlookClient *c) {
            MailTestRunner *runner = [[MailTestRunner alloc] initWithClient:c];
            [self performSegueWithIdentifier:@"segue" sender:runner];
        }];
    }
    
    if([name isEqualToString:@"Files"]){
        [[[BaseController alloc]init]getSharePointClient:^(MSSharePointClient *c) {
            FilesTestRunner *runner = [[FilesTestRunner alloc] initWithClient:c];
            [self performSegueWithIdentifier:@"segue" sender:runner];
        }];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segue"]){
        TestRunnerTableViewController *vc =  segue.destinationViewController;
        vc.TestRunner = (BaseTestRunner*)sender;
    }
}

@end
