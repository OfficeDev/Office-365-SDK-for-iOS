/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* See License.txt in the project root for license information.
******************************************************************************/

import UIKit
import AuthenticationController

class EventsTableViewController: UITableViewController {
    
    var Events = NSArray();
    var spinner = UIActivityIndicatorView(frame: CGRectMake(135,140,50,50));
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var width = self.view.frame.size.width;
        var height = self.view.frame.size.height;
        
        spinner = UIActivityIndicatorView(frame: CGRectMake(0,0, width, height));
        spinner.activityIndicatorViewStyle =  UIActivityIndicatorViewStyle.Gray;
        self.view.addSubview(spinner);
        spinner.hidesWhenStopped = true;
        
        authenticationController.initialize("https://outlook.office365.com/", false) { (Boolean) -> Void in
            self.getEvents();
        };
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.Events.count;
    }
    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell {
        let cell = tableView!.dequeueReusableCellWithIdentifier("Events", forIndexPath: indexPath!) as UITableViewCell
        
        var index : Int = indexPath!.row;
        var event : MSOutlookEvent = self.Events.objectAtIndex(index) as MSOutlookEvent;
        
        var formatter = NSDateFormatter();
        formatter.dateFromString("MM/dd/yy");
        
        cell.textLabel?.text = event.Subject + " " + formatter.stringFromDate(event.Start);
        
        return cell
    }
    
    func getEvents(){
        
        var authenticationController = AuthenticationController.getInstance();
        
        self.spinner.startAnimating();
        
        var client = MSOutlookClient(url: "https://outlook.office365.com/api/v1.0", dependencyResolver: authenticationController.getDependencyResolver());
        
        var event = self.getSampleEvent();
        
        
        var task = client.getMe().getEvents().addEvent(event, withCallback: { (addedEvent, error) -> Void in
            
            client.getMe().getEvents().top(200).filter!("Start ge 2014-12-19").read!({ (events, e) -> Void in
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.Events = events;
                    self.tableView.reloadData();
                    self.spinner.stopAnimating();
                });
            }).resume();
        });
        
        task.resume();
    }
    
    func getSampleEvent() -> MSOutlookEvent{
        
        var event = MSOutlookEvent();
        
        event.Subject = "Today's appointment";
        event.Start = NSDate();
        event.End = NSDate().dateByAddingTimeInterval(3600);
        event.Importance = MSOutlookImportance.High;
        
        var itemBody = MSOutlookItemBody();
        itemBody.Content = "This is the appointment info";
        itemBody.ContentType = MSOutlookBodyType.Text;
        
        event.Body = itemBody;
        
        var attendee = MSOutlookAttendee();
        var email = MSOutlookEmailAddress();
        
        email.Address = "gustavoh@lagash.com";
        attendee.EmailAddress = email;
        
        var attendees = NSMutableArray(object: attendee);
        
        event.Attendees = attendees;
        
        return event;
    }
}