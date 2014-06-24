//
//  ServiceTableViewController.m
//  ToDoList
//
//  Created by Lagash on 6/17/14.
//
//

#import "ServiceTableViewController.h"

@implementation ServiceTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.servicesItems = [[NSMutableArray alloc] init];
    
    [self loadData];
}

-(void)addToken:(NSString*) accesToken{
    self.token = accesToken;
}

-(void)loadData{

    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:spinner];
    spinner.hidesWhenStopped = YES;
    
    [spinner startAnimating];
    
    OAuthentication* authentication = [OAuthentication alloc];
    [authentication setToken:self.token];
    FileDiscoveryClient* client = [[FileDiscoveryClient alloc] initWithUrl:@"" credentials:authentication];
    
    NSURLSessionDataTask* task = [client getDiscoveryInfo:^(NSData* data, NSURLResponse* response, NSError* error) {

        NSError* parseError = nil;
        
        self.servicesItems  =[client parseData : data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           [self.tableView reloadData];
            [spinner stopAnimating];
        });
    }];
    
    [task resume];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.servicesItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* identifier = @"ListPrototypeCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier: identifier forIndexPath:indexPath];
 
    DiscoveryInformation *item = [self.servicesItems objectAtIndex:indexPath.row];
    cell.textLabel.text =[NSString stringWithFormat:@"%@ - %@", item.ServiceName, item.Capability];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
@end