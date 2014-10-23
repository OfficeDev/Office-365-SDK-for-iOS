/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ServicesTableViewController.h"
#import "BaseController.h"

@interface ServicesTableViewController()

@property NSArray *Services;

@end

@implementation ServicesTableViewController

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
    [self getFiles];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.Services.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceCell" forIndexPath:indexPath];
    
    MSOServiceInfo *service = (MSOServiceInfo*)[self.Services objectAtIndex:indexPath.row];
    
    cell.textLabel.text = service.ServiceName;
    
    return cell;
}

-(void)getFiles{
    
    UIActivityIndicatorView *spinner = [BaseController getSpinner:self.view];
    
    [BaseController getClient:^(MSOEntityContainerClient * client) {
            [[[client getAllServices] execute:^(NSArray<MSOServiceInfo> *serviceInfos, NSError *error) {
                if(error == nil){
                    dispatch_async(dispatch_get_main_queue(),
                                   ^{
                                       self.Services = serviceInfos;
                                       [self.tableView reloadData];
                                       [spinner stopAnimating];
                                   });
                }

            }] resume];
    }];
}

- (IBAction)unwindExchangeViews:(UIStoryboardSegue *)segue{
}

- (IBAction)Refresh:(id)sender {
    [self getFiles];
}

@end