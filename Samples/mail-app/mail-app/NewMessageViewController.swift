//
//  NewMessageViewController.swift
//  mail-app
//
//  Created by Gustavo on 9/18/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

import UIKit

class NewMessageViewController: UIViewController{

    @IBOutlet weak var txtBody: UITextView!
    @IBOutlet weak var Subject: UITextField!
    @IBOutlet weak var txtTos: UITextField!
    
    var container = EntityContainer();
    
    @IBAction func Send(sender: AnyObject) {
       
        var  message = Message();
        message.Operations = nil;
        message.Subject = self.Subject.text;
        message.Body = ItemBody();
        message.Body.Content = self.txtBody.text;
        message.ToRecipients = self.getRecipients(self.txtTos.text);
        message.IsDraft = true;
        
        spinner.startAnimating();
        
        var task = self.container.createMessage(message, path: "Drafts") { (result, response, error) -> Void in
            
            if(error == nil){
                var sendTask = result.getOperations().Send({ (code, ResponseStatus, errorR) -> Void in
                    
                   dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.spinner.stopAnimating();
                        var alert = UIAlertController(title: "Susscess", message: "Message sent!", preferredStyle: UIAlertControllerStyle.Alert)
                        
                        self.presentViewController(alert, animated: true, completion: nil)
                        
                        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
                            self.close();
                        }))
                    })
                });
                
                sendTask.resume();
            }
        };
        
        task.resume();
    }
    
    func getRecipients(text : String) -> (NSMutableArray){
    
        var result = NSMutableArray();

        var recipient = Recipient();
        recipient.Address = text;
        result.addObject(recipient);
        return result;
    }
    
    var spinner = UIActivityIndicatorView(frame: CGRectMake(135,140,50,50));
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func close(){
        self.navigationController!.popToRootViewControllerAnimated(true);
    }
}