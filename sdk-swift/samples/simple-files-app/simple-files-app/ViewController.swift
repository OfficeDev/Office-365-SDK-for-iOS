/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* SettingsController *settingsVC = [[SettingsController alloc] initWithNibName:nil bundle:nil];
        
        // Create a tab bar item
        UITabBarItem *settingsItem = [[UITabBarItem alloc] initWithTitle:@"Settings" image:[UIImage imageNamed:@"SettingsTabImage" tag:0];
        settingsVC.tabBarItem = settingsItem;
        
        // Get a reference to the tab bar controller
        UITabBarController *tbC = (UITabBarController*)self.window.rootViewController;
        
        // Get the current view controllers in your tab bar
        NSMutableArray *currentItems = [NSMutableArray arrayWithArray:tbC.viewControllers];
        
        // Add your settings controller
        [currentItems addObject:settingsVC];
        tbC.viewControllers = [NSArray arrayWithArray:currentItems];
        
        // Do any additional setup after loading the view, typically from a nib.*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}