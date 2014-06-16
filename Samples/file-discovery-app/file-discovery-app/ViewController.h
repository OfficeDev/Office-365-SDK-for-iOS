//
//  ViewController.h
//  file-discovery-app
//
//  Created by Lagash on 6/16/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <office365-base-sdk/office365_base_sdk-Swift.h>
#import <ADALiOS/ADAuthenticationContext.h>
#import <ADALiOS/ADAuthenticationParameters.h>
#import <ADALiOS/ADAuthenticationSettings.h>
#import <ADALiOS/ADLogger.h>
#import <ADALiOS/ADInstanceDiscovery.h>

@interface ViewController : UIViewController

- (IBAction)LogIn:(id)sender;

@end

