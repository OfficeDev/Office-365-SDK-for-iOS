//
//  ViewController.swift
//  simple-exchange-app
//
//  Created by Gustavo on 12/18/14.
//  Copyright (c) 2014 MSOpentech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func getMailClient()
    -(void)getMailClient : (void (^) (MSOutlookClient* ))callback{
    
    LogInController* loginController = [[LogInController alloc] init];
    
    [loginController getTokenWith : @"https://outlook.office365.com/" :true completionHandler:^(NSString *token) {
    
    MSODataDefaultDependencyResolver *resolver = [self getDependencyResolver:token];
    callback([[MSOutlookClient alloc] initWithUrl:@"https://outlook.office365.com/api/v1.0" dependencyResolver:resolver]);
    }];
    }*/
}