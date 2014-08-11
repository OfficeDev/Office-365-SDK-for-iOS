//
//  ViewController.h
//  file-discovery-app
//
//  Created by Lagash on 6/16/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ADALiOS/ADAuthenticationContext.h>
#import <ADALiOS/ADAuthenticationParameters.h>
#import <ADALiOS/ADAuthenticationSettings.h>
#import <ADALiOS/ADLogger.h>
#import <ADALiOS/ADInstanceDiscovery.h>

@interface ViewController : UIViewController

- (IBAction)Clear:(id)sender;
- (IBAction)Login:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *LogInButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *GetServicesButton;

- (IBAction)LogIn:(id)sender;

@end