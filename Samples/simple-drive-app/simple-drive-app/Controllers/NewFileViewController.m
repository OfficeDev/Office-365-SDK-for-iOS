/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "NewFileViewController.h"
#import "BaseController.h"

@interface NewFileViewController ()

@end

@implementation NewFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)CreateFile:(id)sender {
    [BaseController getClient:^(MSSharePointClient * client) {
        
        __block UIActivityIndicatorView *spinner = [BaseController getSpinner:self.view];
        
        MSSharePointItem* item = [[MSSharePointItem alloc] init];
        item.name = self.txtName.text;
        item.type = @"File";
       
        NSData* body = [self.txtBody.text dataUsingEncoding:NSUTF8StringEncoding];
        
        [[[client getfiles] add:item :^(MSSharePointItem *item, NSError *e) {
            __block NSString* _id = item.id;
            
            [[[[[client getfiles] getById:_id] asFile] putContent:body :^(int result, NSError *error) {
                
                [[[[[client getfiles] getById:_id] asFile] getContent:^(NSData *content, NSError *error) {
                    
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
    }];
}
@end
