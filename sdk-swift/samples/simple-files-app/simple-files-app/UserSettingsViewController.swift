/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import UIKit

class UserSettingsViewController: UIViewController {
    
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var txtAuthorityUrl: UITextField!
    @IBOutlet weak var txtRedirectUrl: UITextField!;
    @IBOutlet weak var txtClientId: UITextField!;
    
    @IBAction func ClearCredentials(sender: AnyObject) {
        /*LogInController* logInController = [[LogInController alloc] init];
        
        [logInController clearCredentials];
        
        NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults removeObjectForKey:@"LogInUser"];
        [userDefaults synchronize];
        
        self.txtLoggedInUser.text = [userDefaults objectForKey:@"LogInUser"];*/
    }
    
    @IBAction func Save(sender: AnyObject) {
        
        var userDefaults = NSUserDefaults.standardUserDefaults();
        userDefaults.setObject(self.txtAuthorityUrl.text, forKey:"AuthorityUrl");
        userDefaults.setObject(self.txtRedirectUrl.text, forKey:"RedirectUrl");
        userDefaults.setObject(self.txtClientId.text, forKey:"CliendId");
        userDefaults.synchronize();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var userDefaults = NSUserDefaults.standardUserDefaults();
        self.txtAuthorityUrl.text = userDefaults.objectForKey("AuthorityUrl") as? String;
        self.txtRedirectUrl.text = userDefaults.objectForKey("RedirectUrl") as? String;
        self.txtClientId.text = userDefaults.objectForKey("CliendId") as? String;
        self.lblUser.text = userDefaults.objectForKey("LogInUser") as? String;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    required init(coder aDecoder: NSCoder) {
        super.init(nibName: "UserSettingsViewController", bundle: NSBundle.mainBundle())
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}