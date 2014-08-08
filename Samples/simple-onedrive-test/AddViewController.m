//
//  AddViewController.m
//  simple-onedrive-test
//
//  Created by Gustavo on 8/6/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "AddViewController.h"
#import <office365-files-sdk/FileClient.h>
#import <office365-base-sdk/OAuthentication.h>

@interface AddViewController ()

@end

@implementation AddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addItem:(id)sender {
    
    
    NSString *url =@"https://lagashsystems365-my.sharepoint.com/personal/anahih_lagash_com";
    OAuthentication *cred = [[OAuthentication alloc] initWith:self.token];
    
    FileClient *client = [[FileClient alloc] initWithUrl:url credentials:cred];
    NSData *data = [[NSData alloc] initWithContentsOfFile:self.fileContent.text];
    
    NSString *n = [[NSString alloc] initWithFormat: @"%@.txt", self.fileTxt.text];
    NSURLSessionDataTask *task = [client createFile:n overwrite:YES body: data folder:nil :^(FileEntity *file, NSError *error) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
            
        });
        
    }];
    
    [task resume];
    
    
}
@end
