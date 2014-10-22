//
//  NewFileViewController.m
//  simple-drive-app
//
//  Created by Gustavo on 10/22/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "NewFileViewController.h"
#import "BaseController.h"

@interface NewFileViewController ()

@end

@implementation NewFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)CreateFile:(id)sender {
    [[BaseController alloc] getClient:^(MSOEntityContainerClient * client) {
        
        MSOItem* item = [[MSOItem alloc] init];
        item.name = self.txtName.text;
        item.type = @"File";
        
        NSData* body = [self.txtBody.text dataUsingEncoding:NSUTF8StringEncoding];
        
        [[[[client getme] getfiles] add:item :^(MSOItem *item, NSError *e) {
            __block NSString* _id = item.id;
            [[[[[client getme] getfiles] getById:_id] putContent:body :^(int result, NSError *error) {
                
                
                [[[[[client getme] getfiles] getById:_id] getContent:^(NSData *content, NSError *error) {

                }] resume];
                
                
            }] resume];
        }] resume];
    }];
}
@end
