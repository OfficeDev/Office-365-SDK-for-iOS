/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import UIKit
import office365_files_sdk

class FilesTableViewController: UITableViewController {

    var files = NSMutableArray();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getFiles();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.files.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FileCell", forIndexPath: indexPath) as UITableViewCell
        var file = self.files.objectAtIndex(indexPath.row) as MSSharePointItem;
        var id : NSString = file.id;
        cell.textLabel.text = file.name;
        return cell
    }

    func getFiles(){
    
        var spinner = BaseController.getSpinner(self.view);

        BaseController.getClient({ (client) -> Void! in
            client.getFiles().read({ (entities : Array<MSSharePointItem>?, error) -> Void! in
        
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    spinner.stopAnimating();
                    self.files.addObjectsFromArray(entities!);
                    self.tableView.reloadData();
                });
                
                return Void();
                
            }).resume();
        });
    }
}