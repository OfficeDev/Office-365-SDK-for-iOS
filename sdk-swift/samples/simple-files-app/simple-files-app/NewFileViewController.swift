//
//  NewFileViewController.swift
//  simple-files-app
//
//  Created by Gustavo on 11/10/14.
//  Copyright (c) 2014 MsOpentech. All rights reserved.
//

import UIKit
import office365_files_sdk

class NewFileViewController: UIViewController {

    @IBAction func Create(sender: AnyObject) {
        
        var item = MSSharePointItem();
        item.name = self.txtFileName.text;
        item.type = "File";
        var data = NSData(contentsOfFile: self.txtBody.text!);
        BaseController.getClient({(client : MSSharePointClient) -> Void! in
            
            client.getFiles().add(item, callback: { (result : MSSharePointItem?, error : NSError?) -> Void! in
                var file : MSSharePointItem = result!;
                client.getFiles().getById(file.id).asFile().putContent(data!, callback: { (result, error) -> Void! in
                    
                    client.getFiles().getById(file.id).asFile().getContent({ (content, error) -> Void! in
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            var stringContent = NSString(data: content!, encoding: NSUTF8StringEncoding);
                            var alert = UIAlertView(title: "File Created!", message: stringContent, delegate: self, cancelButtonTitle: "Ok");
                            alert.show();
                        });
                        
                    }).resume();
                
                }).resume();
                
                return Void();
            }).resume();
        });
    }
    
    @IBOutlet weak var txtBody: UITextView!
    @IBOutlet weak var txtFileName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
