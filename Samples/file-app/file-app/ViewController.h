//
//  ViewController.h
//  file-app
//
//  Created by Lagash on 6/23/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *GetFilesButton;

- (IBAction)LogIn:(id)sender;

@end

