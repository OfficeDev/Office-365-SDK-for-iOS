//
//  ViewController.h
//  list-app
//
//  Created by Gustavo on 7/15/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <office365_base_sdk/office365_base_sdk-Swift.h>
#import <ADALiOS/ADAuthenticationContext.h>
#import <ADALiOS/ADAuthenticationParameters.h>
#import <ADALiOS/ADAuthenticationSettings.h>
#import <ADALiOS/ADLogger.h>
#import <ADALiOS/ADInstanceDiscovery.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIBarButtonItem *LogInButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *GetItems;


- (IBAction)LogIn:(id)sender;

@end