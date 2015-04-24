/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "NewFileViewController.h"
#import "BaseController.h"

@interface NewFileViewController ()

@property (strong, nonatomic) MSOneDriveServicesClient *client;

@end

@implementation NewFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [BaseController getClient:^(MSOneDriveServicesClient *client) {
        
        self.client = client;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)CreateFile:(id)sender {
    
    __block UIActivityIndicatorView *spinner = [BaseController getSpinner:self.view];
    
    MSOneDriveServicesItem *item = [[MSOneDriveServicesItem alloc] init];
    item.name = self.txtName.text;
    item.type = @"File";
    
    NSData* body = [self.txtBody.text dataUsingEncoding:NSUTF8StringEncoding];
    
    [[[self.client getfiles] addEntity:item callback:^(MSOneDriveServicesItem *item, NSError *e) {
        __block NSString* _id = item.id;
        
        [[[[[self.client getfiles] getById:_id] asFile] putContent:body callback:^(NSInteger result, NSError *error) {
            
            [[[[[self.client getfiles] getById:_id] asFile] getContentWithCallback:^(NSData *content, NSError *error) {
                
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   
                                   NSString* title = @"Error!";
                                   NSString* contentResultString = [NSString alloc];
                                   
                                   if(error == nil){
                                       title = @"File Created!";
                                       contentResultString = [[NSString alloc] initWithData:content encoding:NSUTF8StringEncoding];
                                   }else{
                                       contentResultString = [[error userInfo] objectForKey:0];
                                   }
                                   
                                   [spinner stopAnimating];
                                   UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:contentResultString delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                                   [alert show];
                               });
                
            }] resume];
            
            
        }] resume];
    }] resume];
}
@end
