//
//  MessageTableViewController.swift
//  mail-app
//
//  Created by Gustavo on 9/18/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

import UIKit

class MessageTableViewController: UITableViewController {

    var loginClient = LoginClient();
    var messages = NSArray();
    var spinner = UIActivityIndicatorView(frame: CGRectMake(135,140,50,50));
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logIn();
        var width = self.view.frame.size.width;
        var height = self.view.frame.size.height;
        
        spinner = UIActivityIndicatorView(frame: CGRectMake(0,0, width, height));
        spinner.activityIndicatorViewStyle =  UIActivityIndicatorViewStyle.Gray;
        self.view.addSubview(spinner);
        spinner.hidesWhenStopped = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count;
    }

    
     override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell {
        let cell = tableView!.dequeueReusableCellWithIdentifier("Messages", forIndexPath: indexPath!) as UITableViewCell

        var index : Int = indexPath!.row;
        var message : Message = self.messages.objectAtIndex(index) as Message;
        cell.textLabel?.text = message.From.Name + message.Subject;
        // Configure the cell...

        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        var controller : NewMessageViewController = segue.destinationViewController as NewMessageViewController;
        
        controller.container = self.container;
    }
    
    var token = NSString();
    var authority = NSString();
    var redirectUriString = NSString();
    var resourceId = NSString();
    var clientId = NSString();
    
    func logIn(){
    
        authority = "https://login.windows.net/common";
        resourceId = "https://outlook.office365.com";
        clientId = "a31be332-2598-42e6-97f1-d8ac87370367";
        redirectUriString = "https://lagash.com/oauth";
    
        self.loginClient = LoginClient(parameters: clientId, redirectUriString, resourceId, authority);
        self.loginClient.clearCredentials(nil);
        
        self.loginClient.login(false, completionHandler: { (token, error) -> Void in
            
            if(error == nil){
                
                
                self.token = token;
              
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.initContainer();
                    self.getMessages();
                });
            }});
    }

    var container = EntityContainer();
    
    func initContainer(){
    
        var url = "https://outlook.office365.com/EWS/OData";
        var credentials =  OAuthentication(with: self.token);
    
        container = EntityContainer(url: url, credentials: credentials);
    }
    
    func getMessages(){
    
        spinner.startAnimating();
        var messages : NSURLSessionDataTaskOdata =  container.getMessages("Inbox")
    
        messages.top(50).select("Id,Subject,From");
        
        messages.execute( { (messages, response, error) -> Void in
            self.messages = messages as NSArray;
            self.tableView.reloadData();
            self.spinner.stopAnimating();
        });
    }
    
    @IBAction func Refresh(sender: AnyObject){
        self.getMessages();
    }
}