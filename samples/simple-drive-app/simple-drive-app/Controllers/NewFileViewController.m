/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "NewFileViewController.h"
#import "BaseController.h"

@interface NewFileViewController ()

@property (strong, nonatomic) MSSharePointClient *client;

@end

@implementation NewFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [BaseController getClient:^(MSSharePointClient *client) {
        
        self.client = client;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)CreateFile:(id)sender {
    
    __block UIActivityIndicatorView *spinner = [BaseController getSpinner:self.view];
    
    MSSharePointItem *item = [[MSSharePointItem alloc] init];
    item.name = self.txtName.text;
    item.type = @"File";
    
    NSData* body = [self.txtBody.text dataUsingEncoding:NSUTF8StringEncoding];
    __weak NewFileViewController *weakSelf = self;
    
    [self.client.files add:item callback:^(MSSharePointItem *item, NSError *e) {
        __block NSString* _id = item.id;
        
        [[[weakSelf.client.files getById:_id] asFile] putContent:body callback:^(NSInteger result, MSOrcError *error) {
            
            [[[weakSelf.client.files getById:_id] asFile] getContentWithCallback:^(NSData *content, MSOrcError *error) {
                
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   
                                   NSString* title = @"Error!";
                                   NSString* contentResultString;
                                   
                                   if(error == nil){
                                       title = @"File Created!";
                                       contentResultString = [[NSString alloc] initWithData:content encoding:NSUTF8StringEncoding];
                                   }else{
                                       contentResultString = [[error userInfo] objectForKey:0];
                                   }
                                   
                                   [spinner stopAnimating];
                                   UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:contentResultString delegate:weakSelf cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                                   [alert show];
                               });
                
            }];
        }];
    }];
}
@end
